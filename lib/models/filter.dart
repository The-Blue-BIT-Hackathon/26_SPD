import 'package:khoj/UI/Screens/User/filtersScreen.dart';

class Filter {
  final bool remote;
  final bool onsite;
  final String lSalary;
  final String hSalary;
  final String city;
  final String state;

  Filter({
    required this.remote,
    required this.onsite,
    required this.lSalary,
    required this.hSalary,
    required this.city,
    required this.state,
  });
}
