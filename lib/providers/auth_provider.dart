import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:khoj/models/company.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class Auth extends ChangeNotifier {
  var _isUser = "";
  String? _token;
  final _auth = FirebaseAuth.instance;
  var verificationId = '';
  var _profileCreated = false;

  bool get isAuth {
    return token != null;
  }

  bool get isProfile {
    return _profileCreated;
  }

  String get isUser {
    return _isUser;
  }

  String? get token {
    return _token;
  }

  Future<void> authenticate(String phoneNo) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // await _auth.signInWithCredential(credential).then((value) {});
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print("Invalid Number");
          } else {
            print(e);
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId = verificationId;
        },
      );
      notifyListeners();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> verifyOtp(String otp) async {
    try {
      var cred = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: otp,
        ),
      );
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('UID', _auth.currentUser!.uid);
      prefs.setString('UserType', "");
      prefs.setBool('Profile', false);
      notifyListeners();
      return cred.user != null ? true : false;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> checkUser() async {
    try {
      var user = true;
      CollectionReference users =
          FirebaseFirestore.instance.collection('Users');
      await users.doc(_auth.currentUser?.uid).get().then(
            (datasnapshot) => {
              if (!datasnapshot.exists) {user = false}
            },
          );
      if (!user) {
        CollectionReference ngo = FirebaseFirestore.instance.collection('Ngo');
        await ngo.doc(_auth.currentUser?.uid).get().then(
              (datasnapshot) => {
                if (!datasnapshot.exists) {user = false} else {user = true}
              },
            );
        if (user) {
          _isUser = 'NGO';
          _profileCreated = true;
        }
      } else {
        _isUser = 'Individual';
        _profileCreated = true;
      }
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future chooseUserType(String user) async {
    _isUser = user;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('UserType', user);
    prefs.setBool("Profile", false);
  }

  Future registerUser(Users user) async {
    try {
      var storage = FirebaseStorage.instance;
      TaskSnapshot taskSnapshot = await storage
          .ref()
          .child('Profile/${_auth.currentUser!.uid}')
          .putFile(user.profile);
      TaskSnapshot taskSnapshot2 = await storage
          .ref()
          .child('Resume/${_auth.currentUser!.uid}')
          .putFile(user.resume);

      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      final String downloadUrl2 = await taskSnapshot2.ref.getDownloadURL();
      final uri = Uri.parse(
          "https://khoj-5415b-default-rtdb.firebaseio.com/Users.json");
      final res = await http.post(
        uri,
        body: json.encode({
          'Name': user.name,
          "PhoneNo": user.phone,
          "UID": _auth.currentUser!.uid,
          "Email": user.email,
          "Domain": user.domain,
          "Resume": downloadUrl2,
          "College": user.cllg,
          "DateOfGraduation": user.yearofgrad,
          "Github": user.github,
          "Linkedin": user.linkedin,
          "ProfilePic": downloadUrl,
        }),
      );
      final prefs = await SharedPreferences.getInstance();
      _profileCreated = true;
      prefs.setBool('Profile', _profileCreated);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future registerCompany(Company cmy) async {
    try {
      final uri = Uri.parse(
          "https://khoj-5415b-default-rtdb.firebaseio.com/Company.json");
      final res = await http.post(
        uri,
        body: json.encode({
          'Name': cmy.Cname,
          "PhoneNo": cmy.Cphone,
          "UID": _auth.currentUser!.uid,
          "Email": cmy.Cemail,
          "Website": cmy.website,
          "Company_Size": cmy.company_size,
          "Address": cmy.address,
          "DateOfEst": cmy.dateofest,
          "City": cmy.city,
          "Linkedin": cmy.linkedin,
          "State": cmy.state,
          "Description": cmy.desc,
        }),
      );
      final prefs = await SharedPreferences.getInstance();
      _profileCreated = true;
      prefs.setBool('Profile', _profileCreated);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    await _auth.signOut();
    notifyListeners();
  }

  Future<void> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('UID')) {
      return;
    }
    _token = prefs.getString('UID');
    if (prefs.getString('UserType') != null) {
      _isUser = prefs.getString('UserType')!;
    }
    _profileCreated = prefs.getBool('Profile')!;
    notifyListeners();
  }
}
