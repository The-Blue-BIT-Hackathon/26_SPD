class Post {
  String id;
  final String cid;
  final String salary;
  final String title;
  final String city;
  final String state;
  final String duration;
  final String location;
  final String workinghrs;
  final List<String> responsibility;
  final List<String> skills;

  Post({
    required this.id,
    required this.cid,
    required this.salary,
    required this.title,
    required this.city,
    required this.state,
    required this.duration,
    required this.location,
    required this.workinghrs,
    required this.responsibility,
    required this.skills,
  });
}
