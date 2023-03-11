import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khoj/UI/Screens/widgets/textfield.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class UserRegister extends StatefulWidget {
  static var routeName = "/user-register";
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  var _selectedIntrest;
  final _bioController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _occupationController = TextEditingController();
  final _interestController = TextEditingController();

  File? imageFile;

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
                            child:
                                //  imageFile == null ? Icon(
                                //   Icons.edit,
                                //   color: Colors.white,
                                // ):
                                Icon(
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

                //bio textfield

                const SizedBox(height: 20.0),
                // name
                CustomTextField(
                    controller: _nameController,
                    hintText: 'Dip Hire',
                    icon: Icons.abc,
                    text: 'Your Full Name ?*'),
                const SizedBox(height: 10.0),

                CustomTextField(
                    controller: _phoneController,
                    hintText: '9123456789',
                    icon: Icons.phone,
                    text: 'Your Contact Number ?*'),
                const SizedBox(height: 10.0),
                CustomTextField(
                    controller: _emailController,
                    hintText: 'khoj@gmail.com',
                    icon: Icons.email,
                    text: 'Your Email id ?*'),
                const SizedBox(height: 10.0),
                Divider(),
                const SizedBox(height: 10.0),
                CustomTextField(
                    controller: _emailController,
                    hintText: 'Full stack',
                    icon: Icons.work,
                    text: 'Domain your intrested in ?*'),
                CustomTextField(
                    controller: _emailController,
                    hintText: 'D Y patil Pune',
                    icon: Icons.directions_bus_filled_sharp,
                    text: 'College / University name ?*'),
                const SizedBox(height: 10.0),

                CustomTextField(
                    controller: _emailController,
                    hintText: '2024',
                    icon: Icons.school_rounded,
                    text: 'Year of graduation ?*'),
                const SizedBox(height: 10.0),

                Divider(),
                const SizedBox(height: 10.0),

                CustomTextField(
                    controller: _emailController,
                    hintText: 'github.com/DipHire',
                    icon: Icons.school_rounded,
                    text: 'Your Github profile link ?*'),
                const SizedBox(height: 10.0),

                CustomTextField(
                    controller: _emailController,
                    hintText: 'linkedin.com/DipHire',
                    icon: Icons.school_rounded,
                    text: 'Your LinkedIn profile link ?'),

                const SizedBox(height: 20.0),
                SizedBox(
                  height: 60, //height of button
                  width: 250, //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: kprimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(20)),
                    onPressed: () {},
                    child: const Text(
                      "Register",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Gender {
  String name;
  IconData icon;
  bool isSelected;

  Gender(this.name, this.icon, this.isSelected);
}
