import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:khoj/models/company.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanyProvider extends ChangeNotifier {

  Future registerCompany(Company cmy) async {
    try {
      final uri = Uri.parse(
          "https://khoj-5415b-default-rtdb.firebaseio.com/Company/${cmy.cid}.json");
      final res = await http.post(
        uri,
        body: json.encode({
          'Name': cmy.Cname,
          "PhoneNo": cmy.Cphone,
          "UID": cmy.cid,
          "Email": cmy.Cemail,
          "Website": cmy.website,
          "Company_Size": cmy.company_size,
          "Address": cmy.address,
          "DateOfEst": cmy.dateofest,
          "City": cmy.city,
          "Linkedin": cmy.linkedin,
          "State": cmy.state,
          "Description": cmy.desc,
          "Country" : cmy.country,
        }),
      );
      final resData = json.decode(res.body);
      if(resData['error']==null)
      {
        cmy.subId = resData['name'];
      }
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('Profile', true);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }


  Future getCompany(String id) async {
    final uri = Uri.parse(
        "https://khoj-5415b-default-rtdb.firebaseio.com/Company/$id.json");
    try {
      final res = await http.get(uri);
      final resData = json.decode(res.body) as Map<String, dynamic>;
      Company? cmy;
      resData.forEach((key, value) {
        cmy = Company(
          subId: key,
          Cname: value['Name'],
          Cphone: value['PhoneNo'],
          Cemail: value['Email'],
          website: value['Website'],
          city: value['City'],
          dateofest: value['DateOfEst'],
          state: value['State'],
          linkedin: value['Linkedin'],
          address: value['Address'],
          company_size: value['Company_Size'],
          cid: value['UID'],
          desc: value['Description'],
          country: value['Country'],
        );
      });
      notifyListeners();
      return cmy;
    } catch (e) {
      rethrow;
    }
  }
}
