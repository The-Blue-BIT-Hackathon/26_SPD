import 'dart:convert';

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:khoj/constants.dart';

class FiltersScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FiltersScreenState();
  }
}

class FiltersScreenState extends State<FiltersScreen> {
  RangeValues _currentRangeValues = const RangeValues(20000, 50000);

  bool isRemote = false;
  bool isOnsite = false;
  bool isFilter = false;
  List<String> selected = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: MaterialButton(
            onPressed: () {
              Navigator.pop(context, "");
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.white)),
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
                  SizedBox(
                    height: 10,
                  ),
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
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  Text(
                    "Salary",
                    style: kTextPopB14,
                  ),
                  Text(
                    "In months",
                    style: kTextPopR12,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
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
                              divisions: 10,
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
                  Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  Text(
                    "Location",
                    style: kTextPopB14,
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    child: CSCPicker(
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: kbgColor,
                        border: Border.all(color: kbgColor, width: 2),
                      ),
                      disabledDropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: kbgColor,
                          border: Border.all(color: kbgColor, width: 1)),
                      layout: Layout.vertical,
                      onCountryChanged: (country) {},
                      onStateChanged: (state) {},
                      onCityChanged: (city) {},
                    ),
                  ),
                  Center(
                      child: ElevatedButton(
                          onPressed: () {}, child: Text('Apply filters')))
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
