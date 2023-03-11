import 'dart:io';

class Users {
  String subId;
  final String name;
  final String phone;
  final String email;
  final String domain;
  final String cllg;
  final String yearofgrad;
  final String github;
  final String linkedin;
  final File resume;
  final File profile;
  final String id;

  Users({
    required this.subId,
    required this.name,
    required this.phone,
    required this.email,
    required this.domain,
    required this.cllg,
    required this.yearofgrad,
    required this.github,
    required this.linkedin,
    required this.resume,
    required this.profile,
    required this.id,
  });
}