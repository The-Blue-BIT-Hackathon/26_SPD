import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:khoj/UI/Screens/User/UHomeScreen.dart';
import 'package:khoj/UI/Screens/User/Ubottombar.dart';
import 'package:khoj/constants.dart';

import '../../../models/filter.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter_screen';
  @override
  State<StatefulWidget> createState() {
    return FiltersScreenState();
  }
}

class FiltersScreenState extends State<FiltersScreen> {
  RangeValues _currentRangeValues = const RangeValues(1000, 5000);
  bool isRemote = false;
  bool isOnsite = false;
  bool isFilter = false;
  var ls = "", hs = "";
  List<String> selected = List.empty(growable: true);

  final _countryController = TextEditingController();
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();

  String get country => _countryController.text;
  String get state => _stateController.text;
  String get city => _cityController.text;

  @override
  void initState() {
    super.initState();
    _cityController.text = "";
    _stateController.text = "";
  }

  @override
  void dispose() {
    super.dispose();
    _cityController.dispose();
    _stateController.dispose();
  }

  void _applyFilter() {
    if (_currentRangeValues.start.toString().length == 4) {
      ls = '${_currentRangeValues.start.toString().substring(0, 1)}K';
    } else if (_currentRangeValues.start.toString().length == 5) {
      ls = '${_currentRangeValues.start.toString().substring(0, 2)}K';
    } else if (_currentRangeValues.start.toString().length == 6) {
      ls = '${_currentRangeValues.start.toString().substring(0, 1)}lac';
    }
    if (_currentRangeValues.end.toString().length == 4) {
      hs = '${_currentRangeValues.end.toString().substring(0, 1)}K';
    } else if (_currentRangeValues.end.toString().length == 5) {
      hs = '${_currentRangeValues.end.toString().substring(0, 2)}K';
    } else if (_currentRangeValues.end.toString().length == 6) {
      hs = '${_currentRangeValues.end.toString().substring(0, 1)}lac';
    }
    Filter filter = Filter(
      remote: isRemote,
      onsite: isOnsite,
      lSalary: _currentRangeValues.start.toString(),
      hSalary: _currentRangeValues.end.toString(),
      city: city,
      state: state,
    );
    Navigator.of(context).pushNamed(UserBottomBar.routeName,
        arguments: [isRemote, isOnsite, ls, hs, city, state]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: MaterialButton(
            onPressed: () {
              Navigator.pop(context, "");
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.white)),
        backgroundColor: kprimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Job Type",
                    style: kTextPopB14,
                  ),
                  const SizedBox(height: 10),
                  Row(children: [
                    Checkbox(
                        value: isRemote,
                        onChanged: (value) {
                          setState(() {
                            isRemote = value!;
                            isFilter = true;
                          });
                        }),
                    Text(
                      "Remote",
                      style: kTextPopR14,
                    ),
                  ]),
                  Row(children: [
                    Checkbox(
                        value: isOnsite,
                        onChanged: (value) {
                          setState(() {
                            isOnsite = value!;
                            isFilter = true;
                          });
                        }),
                    Text("Onsite", style: kTextPopR14),
                  ]),
                  const SizedBox(height: 20),
                  const Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  Text(
                    "Salary Monthly",
                    style: kTextPopB14,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                          Text('0', style: kTextPopR12),
                          Expanded(
                            child: RangeSlider(
                              values: _currentRangeValues,
                              min: 0,
                              max: 100000,
                              divisions: 50,
                              labels: RangeLabels(
                                _currentRangeValues.start.round().toString(),
                                _currentRangeValues.end.round().toString(),
                              ),
                              onChanged: (RangeValues values) {
                                setState(() {
                                  _currentRangeValues = values;
                                });
                              },
                            ),
                          ),
                          Text(
                            '100000',
                            style: kTextPopR12,
                          ),
                        ])),
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  Text(
                    "Location",
                    style: kTextPopB14,
                  ),
                  const SizedBox(width: 10.0),
                  CSCPicker(
                    dropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: kbgColor,
                      border: Border.all(color: kbgColor, width: 2),
                    ),
                    disabledDropdownDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: kbgColor,
                        border: Border.all(color: kbgColor, width: 1)),
                    layout: Layout.vertical,
                    onCountryChanged: (country) {},
                    onStateChanged: (state) {
                      _stateController.text = state.toString();
                    },
                    onCityChanged: (city) {
                      _cityController.text = city.toString();
                    },
                  ),
                  Center(
                      child: ElevatedButton(
                          onPressed: _applyFilter,
                          child: const Text('Apply filters')))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Salary {
  String filter_id;
  bool isSelected;
  int salary;
  Salary(this.filter_id, this.isSelected, this.salary);
}
