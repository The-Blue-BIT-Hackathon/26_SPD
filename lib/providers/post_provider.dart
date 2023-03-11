import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class PostProvider extends ChangeNotifier {
  List<Post> posts = [];

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

  Future createPost() async {
    final uri = Uri.parse(
        "https://khoj-5415b-default-rtdb.firebaseio.com/Posts.json");
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
