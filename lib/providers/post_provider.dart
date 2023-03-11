import 'package:flutter/material.dart';

import '../models/post.dart';

class PostProvider extends ChangeNotifier {

  Future createPost(Post post) async {
    final uri = Uri.parse("https://khoj-5415b-default-rtdb.firebaseio.com/Company.json/");
  }
}