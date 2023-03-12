class Post {
  String id;
  final String cid;
  final String cname;
  final String lsalary;
  final String hsalary;
  final String title;
  final String city;
  final String state;
  final String duration;
  final String location;
  final String startDate;
  final String workinghrs;
  final List<dynamic> responsibility;
  final List<dynamic> skills;
  final String applystatus;

  Post({
    required this.applystatus,
    required this.startDate,
    required this.id,
    required this.cid,
    required this.lsalary,
    required this.hsalary,
    required this.title,
    required this.city,
    required this.state,
    required this.duration,
    required this.location,
    required this.workinghrs,
    required this.responsibility,
    required this.skills,
    required this.cname,
  });
}
