import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:khoj/models/filter.dart';
import '../models/post.dart';
import 'package:collection/collection.dart';

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
        var applySt = "Apply";
        if (postData['PUID'] != null) {
          var puid = postData['PUID'] as List<dynamic>;
          puid.firstWhere((element) => element == _auth.currentUser!.uid);
          if (puid.isNotEmpty) {
            applySt = "Applied";
          }
        }
        loadedPost.add(
          Post(
            applystatus: applySt,
            startDate: postData['StartDate'],
            id: postId,
            cid: postData['CID'],
            cname: postData['Cname'],
            lsalary: postData['LSalary'],
            hsalary: postData['HSalary'],
            title: postData['Title'],
            city: postData['City'],
            state: postData['State'],
            location: postData['Location'],
            workinghrs: postData['NoOfHours'],
            responsibility: postData['Responsibilities'],
            skills: [],
          ),
        );
      });
      posts = loadedPost;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future fetchPostFilters(Filter filter) async {
    List<Post> loadedPost = posts;
    if (filter.remote) {
      var p = posts.firstWhereOrNull((element) => element.location == "Remote");
      if (p != null) {
        loadedPost.add(p);
      }
    }
    if (filter.onsite) {
      var p = posts.firstWhereOrNull((element) => element.location == "Onsite");
      if (p != null) {
        loadedPost.add(p);
      }
    }
    if (filter.state.isNotEmpty) {
      if (filter.city.isNotEmpty) {
        var p = posts.firstWhereOrNull((element) =>
        (element.state == filter.state && element.city == filter.city));
        if (p != null) {
          loadedPost.add(p);
        }
      } else {
        var p = posts.firstWhereOrNull((element) => element.state == filter.state);
        if (p!=null) {
          loadedPost.add(p);
        }
      }
    }
    if (filter.lSalary.isNotEmpty && filter.hSalary.isNotEmpty) {
      var p = posts.firstWhereOrNull((element) =>
      (element.lsalary == filter.lSalary &&
          element.hsalary == filter.lSalary));
      if (p != null) {
        loadedPost.add(p);
      }
    }
    posts.clear();
    posts = loadedPost;
  }

  Future fetchAppliedPost() async {
    final uri = Uri.parse(
        "https://khoj-5415b-default-rtdb.firebaseio.com/Users/${_auth.currentUser!.uid}.json");
    try {
      final res = await http.get(uri);
      final extractedData = json.decode(res.body) as Map<String, dynamic>;
      final List<Post> loadedPost = [];
      List<dynamic> puid = [];
      extractedData.forEach((key, value) {
        if (key == 'PUID') {
          puid = value;
        }
      });
      if (puid.isNotEmpty) {
        puid.forEach((pid) {
          loadedPost.add(posts.firstWhere((element) => pid == element.id));
        });
      }
      posts = loadedPost;
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
      final res2 = await http.patch(
        uri,
        body: json.encode({
          'PUID': puid,
        }),
      );

      final uri2 = Uri.parse(
          "https://khoj-5415b-default-rtdb.firebaseio.com/Users/${_auth.currentUser!.uid}.json");
      puid.clear();
      final res3 = await http.get(uri2);
      final extractedData1 = json.decode(res3.body) as Map<String, dynamic>;
      extractedData1.forEach((key, value) {
        if (key == 'PUID') {
          puid = value;
        }
      });
      puid.add(pid);
      final res4 = await http.patch(
        uri2,
        body: json.encode({
          'PUID': puid,
        }),
      );
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
        applystatus: "",
        startDate: extractedData['StartDate'],
        id: pid,
        cid: extractedData['CID'],
        cname: extractedData['Cname'],
        lsalary: extractedData['LSalary'],
        hsalary: extractedData['HSalary'],
        title: extractedData['Title'],
        city: extractedData['City'],
        state: extractedData['State'],
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

  Future createPost(Post post) async {
    final uri =
        Uri.parse("https://khoj-5415b-default-rtdb.firebaseio.com/Posts.json");
    try {
      final res = await http.post(
        uri,
        body: json.encode({
          'StartDate': post.startDate,
          'Cname': post.cname,
          'CID': post.cid,
          'ID': post.id,
          'LSalary': post.lsalary,
          'HSalary': post.hsalary,
          'Title': post.title,
          'City': post.city,
          'State': post.state,
          'NoOfHours': post.workinghrs,
          'Location': post.location,
          'Responsibilities': post.responsibility,
          'Skills': post.skills,
          'PUID': [],
        }),
      );
      final resData = json.decode(res.body);
      if (resData['error'] == null) {
        post.id = resData['name'];
      }
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
