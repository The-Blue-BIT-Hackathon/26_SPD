import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class PostProvider extends ChangeNotifier {
  Future createPost(Post post) async {
    final uri = Uri.parse(
        "https://khoj-5415b-default-rtdb.firebaseio.com/Company/${post.cid}/Post/${post.id}.json");
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
      print(res.body);
    } catch (e) {
      rethrow;
    }
  }
}
