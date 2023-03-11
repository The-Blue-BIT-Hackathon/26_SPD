import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:khoj/UI/Screens/widgets/roundedappBar.dart';

import '../../../constants.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final _cnamecontroller = TextEditingController();
  final _salarycontroller = TextEditingController();
  final _datecontroller = TextEditingController();
  final _titlecontroller = TextEditingController();
  final _durationController = TextEditingController();
  final _locationController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _startDateController = TextEditingController();
  final _workinghrsController = TextEditingController();
  final _responsibilityController = TextEditingController();
  final _skillsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          flexibleSpace: RoundAppBar(
            title: 'Create',
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _cnamecontroller,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Company Name",
                    hintStyle: kTextPopR14,
                    icon: Icon(Icons.person),
                    filled: true,
                    fillColor: kbgColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _titlecontroller,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Job Title",
                    hintStyle: kTextPopR14,
                    icon: Icon(Icons.person),
                    filled: true,
                    fillColor: kbgColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _salarycontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Salary",
                    hintStyle: kTextPopR14,
                    icon: Icon(Icons.person),
                    filled: true,
                    fillColor: kbgColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _skillsController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Skills required",
                    hintStyle: kTextPopR14,
                    icon: Icon(Icons.person),
                    filled: true,
                    fillColor: kbgColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10.0),
                TextField(
                  maxLines: 5,
                  controller: _responsibilityController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Responsibility",
                    hintStyle: kTextPopR14,
                    icon: Icon(Icons.person),
                    filled: true,
                    fillColor: kbgColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _workinghrsController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Working Hours",
                    hintStyle: kTextPopR14,
                    icon: Icon(Icons.person),
                    filled: true,
                    fillColor: kbgColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: double.infinity,
                  height: 60.0,
                  child: TextFormField(
                      controller: _datecontroller,
                      // onTap: ,
                      decoration: InputDecoration(
                        hintText: "Start Date",
                        hintStyle: kTextPopR14,
                        icon: Icon(
                          Icons.calendar_today_rounded,
                        ),
                        filled: true,
                        fillColor: kbgColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Date Not Set !';
                        }
                        return null;
                      },
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2024));
                        if (pickedDate != null) {
                          //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat.yMMMMd('en_US').format(pickedDate);
                          setState(() {
                            _datecontroller.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      }),
                ),
                const SizedBox(height: 10.0),
                CSCPicker(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
