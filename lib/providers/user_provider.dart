import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:khoj/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  Future registerUser(Users user) async {
    try {
      var storage = FirebaseStorage.instance;
      TaskSnapshot taskSnapshot = await storage
          .ref()
          .child('Profile/${user.id}')
          .putFile(user.profile);
      TaskSnapshot taskSnapshot2 = await storage
          .ref()
          .child('Resume/${user.id}')
          .putFile(user.resume);

      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      final String downloadUrl2 = await taskSnapshot2.ref.getDownloadURL();
      final uri = Uri.parse(
          "https://khoj-5415b-default-rtdb.firebaseio.com/Users/${user.id}.json");
      final res = await http.post(
        uri,
        body: json.encode({
          'Name': user.name,
          "PhoneNo": user.phone,
          "UID": user.id,
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
      final resData = json.decode(res.body);
      if(resData['error']==null)
      {
        user.subId = resData['name'];
      }
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('Profile', true);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future getUser(String id, String subid) async {
    final uri = Uri.parse(
        "https://khoj-5415b-default-rtdb.firebaseio.com/Users/$id.json");
    try {
      final res = await http.get(uri);
      final resData = json.decode(res.body) as Map<String, dynamic>;
      Users? user;
      resData.forEach((key, value) {
        user = Users(
          subId: key,
          name: value['Name'],
          phone: value['PhoneNo'],
          email: value['Email'],
          domain: value['Domain'],
          cllg: value['College'],
          yearofgrad: value['DateOfGraduation'],
          github: value['Github'],
          linkedin: value['Linkedin'],
          resume: File(value['Resume']),
          profile: File(value['ProfilePic']),
          id: value['UID'],
        );
      });
      notifyListeners();
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
