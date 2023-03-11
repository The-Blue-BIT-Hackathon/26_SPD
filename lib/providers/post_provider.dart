import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class PostProvider extends ChangeNotifier {
  List<Post> posts = [];
  final _auth = FirebaseAuth.instance;

  Future fetchPost() async {
    final uri =
        Uri.parse("https://khoj-5415b-default-rtdb.firebaseio.com/Posts.json");
    try {
      final response = await http.get(uri);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Post> loadedPost = [];
      extractedData.forEach((postId, postData) {
        loadedPost.add(
          Post(
            startDate: postData['StartDate'],
            id: postId,
            cid: postData['CID'],
            cname: postData['Cname'],
            salary: postData['Salary'],
            title: postData['Title'],
            city: postData['City'],
            state: postData['State'],
            duration: postData['Duration'],
            location: postData['Location'],
            workinghrs: postData['NoOfHours'],
            responsibility: postData['Responsibilities'],
            skills: postData['Skills'],
          ),
        );
      });
      posts = loadedPost;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future applyPost(String pid) async {
    final uri = Uri.parse(
        "https://khoj-5415b-default-rtdb.firebaseio.com/Posts/$pid.json");
    try {
      final res = await http.get(uri);
      final extractedData = json.decode(res.body);
      List<dynamic> puid = [];
      if (extractedData['PUID'] != null) {
        puid = extractedData['PUID'];
      }
      puid.add(_auth.currentUser!.uid);
      final res2 = await http.patch(uri,
          body: json.encode({
            'PUID': puid,
          }));

      final uri2 = Uri.parse(
          "https://khoj-5415b-default-rtdb.firebaseio.com/Users/${_auth.currentUser!.uid}.json");
      puid.clear();
      final res3 = await http.get(uri2);
      final extractedData1 = json.decode(res3.body) as Map<String, dynamic>;
      extractedData1.forEach((key, value) {
        if(value['PUID']!=null)
          {
            puid = value['PUID'];
          }
      });
      puid.add(pid);
      final res4 = await http.patch(uri2,
          body: json.encode({
            'PUID': puid,
          }));
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future fetchPostById(String pid) async {
    final uri = Uri.parse(
        "https://khoj-5415b-default-rtdb.firebaseio.com/Posts/$pid.json");
    try {
      final res = await http.get(uri);
      final extractedData = json.decode(res.body);
      Post p = Post(
        startDate: extractedData['StartDate'],
        id: pid,
        cid: extractedData['CID'],
        cname: extractedData['Cname'],
        salary: extractedData['Salary'],
        title: extractedData['Title'],
        city: extractedData['City'],
        state: extractedData['State'],
        duration: extractedData['Duration'],
        location: extractedData['Location'],
        workinghrs: extractedData['NoOfHours'],
        responsibility: extractedData['Responsibilities'],
        skills: extractedData['Skills'],
      );
      notifyListeners();
      return p;
    } catch (e) {
      rethrow;
    }
  }

  Future createPost() async {
    final uri =
        Uri.parse("https://khoj-5415b-default-rtdb.firebaseio.com/Posts.json");
    try {
      final res = await http.post(
        uri,
        body: json.encode({
          'StartDate': posts[0].startDate,
          'Cname': posts[0].cname,
          'CID': posts[0].cid,
          'ID': posts[0].id,
          'Salary': posts[0].salary,
          'Title': posts[0].title,
          'City': posts[0].city,
          'State': posts[0].state,
          'Duration': posts[0].duration,
          'NoOfHours': posts[0].workinghrs,
          'Location': posts[0].location,
          'Responsibilities': posts[0].responsibility,
          'Skills': posts[0].skills,
          'PUID': [],
        }),
      );
      final resData = json.decode(res.body);
      if (resData['error'] == null) {
        posts[0].id = resData['name'];
      }
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
