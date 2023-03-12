import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:khoj/UI/Screens/widgets/roundedappBar.dart';
import 'package:khoj/models/post.dart';
import 'package:khoj/providers/post_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String _selectedLocation = '';

  bool isRemote = false;
  bool isOnsite = false;
  bool isFilter = false;
  RangeValues _currentRangeValues = const RangeValues(0, 0);

  List<TextEditingController> _controllers = [];
  int _counter = 1;
  var _hours;

  List<String> _tags = [];

  final _cnameController = TextEditingController();
  final _salaryController = TextEditingController();
  final _dateController = TextEditingController();
  final _titleController = TextEditingController();
  final _durationController = TextEditingController();
  final _locationController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _startDateController = TextEditingController();
  final _workinghrsController = TextEditingController();
  final _responsibilityController = TextEditingController();
  final _skillsController = TextEditingController();

  String get date => _dateController.text;
  String get title => _titleController.text;
  String get duration => _durationController.text;
  String get city => _cityController.text;
  String get state => _stateController.text;
  String get workingHrs => _workinghrsController.text;
  String get location => _locationController.text;
  String get cname => _cnameController.text;

  @override
  void initState() {
    super.initState();
    _controllers.add(TextEditingController());
    _dateController.text = "";
    _titleController.text = "";
    _durationController.text = "";
    _cityController.text = "";
    _stateController.text = "";
    _workinghrsController.text = "";
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _dateController.dispose();
    _titleController.dispose();
    _durationController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _workinghrsController.dispose();
    super.dispose();
  }

  void _addTextField() {
    setState(() {
      _counter++;
      _controllers.add(TextEditingController());
    });
  }

  Future createPost() async {
    var ls = "", hs = "";
    if (_currentRangeValues.start.toString().length == 6) {
      ls = '${_currentRangeValues.start.toString().substring(0, 1)}K';
    } else if (_currentRangeValues.start.toString().length == 7) {
      ls = '${_currentRangeValues.start.toString().substring(0, 2)}K';
    } else if (_currentRangeValues.start.toString().length == 8) {
      ls = '${_currentRangeValues.start.toString().substring(0, 1)}lac';
    } else {
      ls = "0";
    }
    if (_currentRangeValues.end.toString().length == 6) {
      hs = '${_currentRangeValues.end.toString().substring(0, 1)}K';
    } else if (_currentRangeValues.end.toString().length == 7) {
      hs = '${_currentRangeValues.end.toString().substring(0, 2)}K';
    } else if (_currentRangeValues.end.toString().length == 8) {
      hs = '${_currentRangeValues.end.toString().substring(0, 1)}lac';
    }
    final auth = FirebaseAuth.instance;
    Post p = Post(
      applystatus: "",
      startDate: _dateController.text,
      id: "",
      cid: auth.currentUser!.uid,
      lsalary: ls,
      hsalary: hs,
      title: title,
      city: _cityController.text,
      state: _stateController.text,
      duration: duration,
      location: location,
      workinghrs: _hours,
      responsibility: [],
      skills: [],
      cname: cname,
    );
    await Provider.of<PostProvider>(context, listen: false).createPost(p);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 80,
          flexibleSpace: const RoundAppBar(title: 'Create Post'),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                TextField(
                  controller: _cnameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Company Name",
                    hintStyle: kTextPopR14,
                    icon: const Icon(Icons.domain),
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
                  controller: _titleController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Job Title",
                    hintStyle: kTextPopR14,
                    icon: const Icon(Icons.work),
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
                const SizedBox(width: 10),
                Column(
                  children: [
                    Wrap(
                      children: _tags
                          .map(
                            (tag) => InputChip(
                              backgroundColor: kbgColor,
                              label: Text(tag),
                              onDeleted: () {
                                setState(() {
                                  _tags.remove(tag);
                                });
                              },
                            ),
                          )
                          .toList(),
                    ),
                    TextField(
                      controller: _skillsController,
                      decoration: InputDecoration(
                        hintText: 'Enter skills',
                        hintStyle: kTextPopR14,
                        icon: const Icon(Icons.code),
                        filled: true,
                        fillColor: kbgColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              _tags.add(_skillsController.text);
                              _skillsController.clear();
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 10),
                // TextField(
                //   controller: _skillsController,
                //   keyboardType: TextInputType.name,
                //   decoration: InputDecoration(
                //     hintText: "Skills required",
                //     hintStyle: kTextPopR14,
                //     icon: const Icon(Icons.code),
                //     filled: true,
                //     fillColor: kbgColor,
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide.none,
                //     ),
                //   ),
                //   textInputAction: TextInputAction.next,
                // ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    for (var i = 0; i < _counter; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextField(
                          controller: _responsibilityController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: "Job Requirement",
                            hintStyle: kTextPopR14,
                            icon: const Icon(Icons.work_outline_rounded),
                            filled: true,
                            fillColor: kbgColor,
                            suffixIcon: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  _addTextField();
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Job Type',
                      style: kTextPopR14,
                    ),
                    RadioListTile(
                      activeColor: kprimaryColor,
                      title: Text('Remote'),
                      value: 'remote',
                      groupValue: _selectedLocation,
                      onChanged: (value) {
                        setState(() {
                          _selectedLocation = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      activeColor: kprimaryColor,
                      title: Text('Onsite'),
                      value: 'onsite',
                      groupValue: _selectedLocation,
                      onChanged: (value) {
                        setState(() {
                          _selectedLocation = value!;
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: kbgColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButton(
                    hint: const Text('Working Hours'),
                    value: _hours,
                    items: ['2-3', '3-5', '5-7', '8-12'].map((size) {
                      return DropdownMenuItem(
                        value: size,
                        child: Text(size),
                        onTap: () {
                          setState(() {
                            _hours = size;
                          });
                        },
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _workinghrsController.text = value.toString();
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: double.infinity,
                  height: 60.0,
                  child: TextFormField(
                      controller: _dateController,
                      // onTap: ,
                      decoration: InputDecoration(
                        hintText: "Start Date",
                        hintStyle: kTextPopR14,
                        icon: const Icon(
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
                            _dateController.text = formattedDate;
                          });
                        } else {}
                      }),
                ),

                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: kbgColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButton(
                    hint: const Text('Working Hours'),
                    value: _hours,
                    items: ['2-3', '3-5', '5-7', '8-12'].map((size) {
                      return DropdownMenuItem(
                        value: size,
                        child: Text(size),
                        onTap: () {
                          setState(() {
                            _hours = size;
                          });
                        },
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _workinghrsController.text = value.toString();
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10.0),

                CSCPicker(
                  dropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: kbgColor,
                    border: Border.all(color: kbgColor, width: 2),
                  ),
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: kbgColor,
                      border: Border.all(color: kbgColor, width: 1)),
                  layout: Layout.vertical,
                  onCountryChanged: (country) {},
                  onStateChanged: (state) {},
                  onCityChanged: (city) {},
                ),
                const SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                    onPressed: createPost, child: const Text('Create Post')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
