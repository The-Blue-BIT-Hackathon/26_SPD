import 'dart:io';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:khoj/UI/Screens/widgets/textfield.dart';
import 'package:khoj/constants.dart';
import 'package:provider/provider.dart';

class CompanyRegister extends StatefulWidget {
  static var routeName = '/ngo-register';

  const CompanyRegister({super.key});

  @override
  State<CompanyRegister> createState() => _CompanyRegisterState();
}

class _CompanyRegisterState extends State<CompanyRegister> {
  var _selectedIntrest;
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
  final _zipcodeController = TextEditingController();
  final _stateController = TextEditingController();
  String get date => _datecontroller.text;
  String get name => _nameController.text;
  String get phone => _phoneController.text;
  String get email => _emailController.text;
  String get bio => _bioController.text;
  String get zipcode => _zipcodeController.text;
  String get city => _cityController.text;
  String get state => _stateController.text;
  String category = "";
  File? imageFile;
  var isLoading = false;

  @override
  void initState() {
    _nameController.text = "";
    _phoneController.text = "";
    _emailController.text = "";
    _bioController.text = "";
    _cityController.text = "";
    _stateController.text = "";
    _zipcodeController.text = "";
    _datecontroller.text = "";
    type.add(Type("Profit", false));
    type.add(Type("Non-Profit", false));
    ngoReg.add(Registered("Yes", false));
    ngoReg.add(Registered("No", false));
    super.initState();
  }

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _phoneController.dispose();
  //   _emailController.dispose();
  //   _bioController.dispose();
  //   _datecontroller.dispose();
  //   _cityController.dispose();
  //   _stateController.dispose();
  //   _zipcodeController.dispose();
  //   super.dispose();
  // }

  // Future _createProfile(BuildContext ctx) async {
  //   var authProvider = Provider.of<Auth>(ctx, listen: false);
  //   setState(() {
  //     isLoading = true;
  //   });
  //   if (imageFile == null) {
  //     print("Please Select Profile Pic");
  //   } else {
  //     await authProvider
  //         .registerNgo(bio, name, phone, email, ngoType, date, ngoRegisterd,
  //             city, zipcode, state, category, imageFile!)
  //         .catchError((e) {
  //       print("Failure");
  //     }).then((_) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       Navigator.of(ctx).pushReplacementNamed(NgoBottomBar.routeName);
  //     });
  //   }
  // }

  // Future _getFromGallery() async {
  //   PickedFile? pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 0.0),
            child: Column(
              children: [
                const SizedBox(height: 30.0),
                //profile picture
                Stack(
                  children: [
                    imageFile != null
                        ? CircleAvatar(
                            radius: 50,
                            child: CircleAvatar(
                              backgroundImage: Image.file(
                                imageFile!,
                                fit: BoxFit.cover,
                              ).image,
                              radius: 60,
                            ),
                          )
                        : const CircleAvatar(
                            radius: 50,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/profile.png"),
                              radius: 60,
                            ),
                          ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: InkWell(
                        onTap: () {
                          // _getFromGallery();
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),

                const SizedBox(height: 20.0),
                // Row(
                //   children: [
                //     const SizedBox(width: 10),
                //     Text(
                //       "Ngo Details",
                //       textAlign: TextAlign.left,
                //       style: kTextPopB14,
                //     ),
                //   ],
                // ),
                // const SizedBox(width: 20),

                // name
                CustomTextField(
                    controller: _nameController,
                    hintText: 'Dip Hire',
                    icon: Icons.abc,
                    text: 'Company Name'),
                const SizedBox(height: 10.0),
                CustomTextField(
                    controller: _phoneController,
                    hintText: '+91987654321',
                    icon: Icons.abc,
                    text: 'Contact number'),
                const SizedBox(height: 10.0),
                // TextFormField(
                //   maxLength: 10,
                //   controller: _phoneController,
                //   keyboardType: TextInputType.number,
                //   decoration: InputDecoration(
                //     counterText: '',
                //     prefixText: '+91 ',
                //     prefixStyle: kTextPopB14,
                //     hintText: "Contact number",
                //     hintStyle: kTextPopR14,
                //     icon: Icon(Icons.phone),
                //     filled: true,
                //     fillColor: Colors.green.shade100,
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide.none,
                //     ),
                //   ),
                //   textInputAction: TextInputAction.next,
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'Please enter your phone number';
                //     }
                //     final phoneRegex = RegExp(r'^\+?\d{9,15}$');
                //     if (!phoneRegex.hasMatch(value)) {
                //       return 'Please enter a valid phone number';
                //     }
                //     return null;
                //   },
                // ),

                const SizedBox(height: 10.0),
                CustomTextField(
                    controller: _emailController,
                    hintText: 'company@gmail.com',
                    icon: Icons.work,
                    text: 'Company email'),
                const SizedBox(height: 10.0),
                CustomTextField(
                    controller: _bioController,
                    hintText: 'company@gmail.com',
                    icon: Icons.work,
                    text: 'Company Description'),
                const SizedBox(height: 10.0),
                CustomTextField(
                    controller: _bioController,
                    hintText: 'company.com',
                    icon: Icons.work,
                    text: 'Company Website'),
                const SizedBox(height: 10.0),

                SizedBox(height: 10.0),
                
                const SizedBox(height: 10.0),

                CustomTextField(
                    controller: _bioController,
                    hintText: 'Address',
                    icon: Icons.location_on_rounded,
                    text: 'Company Location'),
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

               
                const SizedBox(height: 10),
                Divider(),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 22.0, vertical: 0.0),
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
                      // Container(
                      //   padding: const EdgeInsets.all(10),
                      //   width: double.infinity,
                      //   height: 50.0,
                      //   decoration: BoxDecoration(
                      //     color: kbgColor,
                      //     borderRadius: BorderRadius.circular(10.0),
                      //   ),
                      //   child: DropdownButton(
                      //     icon: Icon(Icons.arrow_drop_down_rounded),
                      //     hint: Row(
                      //       children: [
                      //         const SizedBox(width: 10.0),
                      //         Icon(
                      //           Icons.interests_rounded,
                      //           color: kprimaryColor,
                      //         ),
                      //         const SizedBox(width: 10.0),
                      //         const Text('Select a category'),
                      //       ],
                      //     ),
                      //     value: _selectedIntrest,
                      //     items: ['Cleaning', 'Child Care', 'Women Empowerment']
                      //         .map((cat) {
                      //       return DropdownMenuItem(
                      //         value: cat,
                      //         child: Text(cat),
                      //         onTap: () {
                      //           setState(() {
                      //             category = cat;
                      //           });
                      //         },
                      //       );
                      //     }).toList(),
                      //     onChanged: (value) {
                      //       setState(() {
                      //         _selectedIntrest = value!;
                      //       });
                      //     },
                      //   ),
                      // ),

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
                          icon: Icon(Icons.arrow_drop_down_rounded),
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
                          items: ['1-10', '10-50', '50-100', '100+'].map((cat) {
                            return DropdownMenuItem(
                              value: cat,
                              child: Text(cat),
                              onTap: () {
                                setState(() {
                                  category = cat;
                                });
                              },
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedIntrest = value!;
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
                            // _createProfile(context);
                          },
                          child: const Text(
                            "Register",
                          ),
                        ),
                      ),
                      // FloatingActionButton.extended(
                      //   elevation: 0,
                      //   backgroundColor: Colors.green,
                      //   foregroundColor: Colors.green,
                      //   shape: const StadiumBorder(
                      //       side: BorderSide(
                      //           color: Colors.green, width: 1)),
                      //   label: const Text(
                      //     "        Done        ",
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      //   onPressed: () {
                      //     // Navigator.of(context).pushReplacementNamed(NgoBottomBar.routeName);
                      //     setState(() {
                      //       isLoading = true;
                      //     });
                      //     _createProfile(context);
                      //   },
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
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
