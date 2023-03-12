import 'dart:io';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khoj/UI/Screens/Company/Cbottombar.dart';
import 'package:khoj/UI/Screens/widgets/textfield.dart';
import 'package:khoj/constants.dart';
import 'package:khoj/models/company.dart';
import 'package:khoj/providers/auth_provider.dart';
import 'package:khoj/providers/company_provider.dart';
import 'package:provider/provider.dart';

class CompanyRegister extends StatefulWidget {
  static var routeName = '/company-register';

  const CompanyRegister({super.key});

  @override
  State<CompanyRegister> createState() => _CompanyRegisterState();
}

class _CompanyRegisterState extends State<CompanyRegister> {
  List<Type> type = [];
  List<Registered> ngoReg = [];
  String ngoType = "";
  String ngoRegisterd = "";

  final _datecontroller = TextEditingController();
  final _bioController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _cityController = TextEditingController();
  final _websiteController = TextEditingController();
  final _stateController = TextEditingController();
  final _linkedinController = TextEditingController();
  final _addressController = TextEditingController();
  final _companySizeController = TextEditingController();
  final _countryController = TextEditingController();

  String get country => _countryController.text;
  String get address => _addressController.text;
  String get date => _datecontroller.text;
  String get name => _nameController.text;
  String get phone => _phoneController.text;
  String get email => _emailController.text;
  String get bio => _bioController.text;
  String get website => _websiteController.text;
  String get city => _cityController.text;
  String get state => _stateController.text;
  String get link => _linkedinController.text;
  String get companySize => _companySizeController.text;

  final _form = GlobalKey<FormState>();
  String category = "";
  File? imageFile;
  var isLoading = false;
  var _selectedIntrest;

  @override
  void initState() {
    _nameController.text = "";
    _phoneController.text = "";
    _emailController.text = "";
    _bioController.text = "";
    _cityController.text = "";
    _stateController.text = "";
    _websiteController.text = "";
    _datecontroller.text = "";
    _linkedinController.text = "";
    _countryController.text = "";
    type.add(Type("Profit", false));
    type.add(Type("Non-Profit", false));
    ngoReg.add(Registered("Yes", false));
    ngoReg.add(Registered("No", false));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<Auth>(context).checkUser();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    _datecontroller.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _websiteController.dispose();
    _linkedinController.dispose();
    super.dispose();
  }

  Future _createProfile(BuildContext ctx) async {
    var companyProvider = Provider.of<CompanyProvider>(ctx, listen: false);
    final isValid = _form.currentState!.validate();
    final auth = FirebaseAuth.instance;
    setState(() {
      isLoading = true;
    });
    _form.currentState!.save();
    if (isValid) {
      await companyProvider
          .registerCompany(Company(
        subId: "",
        Cname: name,
        Cemail: email,
        Cphone: phone,
        website: website,
        linkedin: link,
        dateofest: date,
        city: city,
        state: state,
        address: address,
        desc: bio,
        company_size: companySize,
        cid: auth.currentUser!.uid,
        country: country,
      ))
          .catchError((e) {
        print("Failure");
      }).then((_) {
        setState(() {
          isLoading = false;
        });
        Navigator.of(ctx).pushReplacementNamed(CompanyBottomBar.routeName);
      });
    } else {
      setState(() {
        isLoading = false;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 0.0),
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Form(
                  key: _form,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _nameController,
                        hintText: 'Dip Hire',
                        icon: Icons.abc,
                        text: 'Company Name',
                        Ttype: TextInputType.name,
                      ),
                      const SizedBox(height: 10.0),
                      CustomTextField(
                        controller: _phoneController,
                        hintText: '+91987654321',
                        icon: Icons.abc,
                        text: 'Contact number',
                        Ttype: TextInputType.phone,
                      ),
                      const SizedBox(height: 10.0),
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'company@gmail.com',
                        icon: Icons.work,
                        text: 'Company email',
                        Ttype: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 10.0),
                      CustomTextField(
                        controller: _bioController,
                        hintText: 'abc',
                        icon: Icons.work,
                        text: 'Company Description',
                        Ttype: TextInputType.text,
                      ),
                      const SizedBox(height: 10.0),
                      CustomTextField(
                        controller: _websiteController,
                        hintText: 'company.com',
                        icon: Icons.work,
                        text: 'Company Website',
                        Ttype: TextInputType.url,
                      ),

                      const SizedBox(height: 10.0),
                      CustomTextField(
                        controller: _addressController,
                        hintText: 'Address',
                        icon: Icons.location_on_rounded,
                        text: 'Company Location',
                        Ttype: TextInputType.text,
                      ),
                      const SizedBox(height: 10.0),

                      CSCPicker(
                        dropdownDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: kbgColor,
                          border: Border.all(color: kbgColor, width: 2),
                        ),
                        disabledDropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: kbgColor,
                            border: Border.all(color: kbgColor, width: 1)),
                        layout: Layout.vertical,
                        onCountryChanged: (country) {
                          _countryController.text = country.toString();
                        },
                        onStateChanged: (s) {
                          setState(() {
                            _stateController.text = s.toString();
                          });
                        },
                        onCityChanged: (city) {
                          _cityController.text = city.toString();
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // border: Border.all(color: kprimaryColor, width: 2),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Date of Establishment",
                            textAlign: TextAlign.left,
                            style: kTextPopR14,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        width: double.infinity,
                        height: 60.0,
                        child: TextFormField(
                            controller: _datecontroller,
                            // onTap: ,
                            decoration: InputDecoration(
                              hintText: "Date",
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
                                    DateFormat.yMMMMd('en_US')
                                        .format(pickedDate);
                                setState(() {
                                  _datecontroller.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            }),
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        children: [
                          Text(
                            "Company Details",
                            textAlign: TextAlign.left,
                            style: kTextPopR14,
                          ),
                        ],
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
                          icon: const Icon(Icons.arrow_drop_down_rounded),
                          hint: Row(
                            children: [
                              const SizedBox(width: 10.0),
                              Icon(
                                Icons.interests_rounded,
                                color: kprimaryColor,
                              ),
                              const SizedBox(width: 10.0),
                              const Text('Company Size'),
                            ],
                          ),
                          value: _selectedIntrest,
                          items:
                              ['1-10', '10-50', '50-100', '100+'].map((size) {
                            return DropdownMenuItem(
                              value: size,
                              child: Text(size),
                              onTap: () {
                                setState(() {
                                  _selectedIntrest = size;
                                });
                              },
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _companySizeController.text = value.toString();
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 60, //height of button
                        width: 250, //width of button
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary:
                                  kprimaryColor, //background color of button
                              shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.all(
                                  20) //content padding inside button
                              ),
                          onPressed: () {
                            // Navigator.of(context).pushReplacementNamed(NgoBottomBar.routeName);
                            setState(() {
                              isLoading = true;
                            });
                            _createProfile(context);
                          },
                          child: const Text(
                            "Register",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Type {
  String name;
  bool isSelected;

  Type(this.name, this.isSelected);
}

class Registered {
  String name;
  bool isSelected;

  Registered(this.name, this.isSelected);
}
