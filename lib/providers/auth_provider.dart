import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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
      final useruri = Uri.parse(
          "https://shopify-84a7c-default-rtdb.firebaseio.com/Users/${_auth.currentUser!.uid}.json");
      final res = await http.get(useruri);
      if(res.body.isNotEmpty)
        {
          _isUser = 'JobSeeker';
          _profileCreated = true;
          return true;
        }
      else
        {
          final cmpuri = Uri.parse(
              "https://shopify-84a7c-default-rtdb.firebaseio.com/Company/${_auth.currentUser!.uid}.json");
          final rescmp = await http.get(cmpuri);
          if(rescmp.body.isNotEmpty)
            {
              _isUser = 'JobPoster';
              _profileCreated = true;
              return true;
            }
        }
      return false;
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
