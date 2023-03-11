import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class PostProvider extends ChangeNotifier {

  Future createPost(Post post) async {
    final uri = Uri.parse(
        "https://khoj-5415b-default-rtdb.firebaseio.com/Posts/${post.cid}.json");
    try {
      final res = await http.post(
        uri,
        body: json.encode({
          'ID': post.id,
          'Salary': post.salary,
          'Title': post.title,
          'City': post.city,
          'State': post.state,
          'Duration': post.duration,
          'NoOfHours': post.workinghrs,
          'Location': post.location,
          'Responsibilties': post.responsibility,
          'Skills': post.skills,
        }),
      );
      final resData = json.decode(res.body);
      if(resData['error']==null)
        {
          post.id = resData['name'];
        }

    } catch (e) {
      rethrow;
    }
  }
}
