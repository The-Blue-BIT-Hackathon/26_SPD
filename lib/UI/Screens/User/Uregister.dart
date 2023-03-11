import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khoj/UI/Screens/User/Ubottombar.dart';
import 'package:khoj/UI/Screens/widgets/textfield.dart';
import 'package:khoj/models/user.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../providers/user_provider.dart';

class UserRegister extends StatefulWidget {
  static var routeName = "/user-register";
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  var _selectedIntrest;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _domainController = TextEditingController();
  final _cllgController = TextEditingController();
  final _yearController = TextEditingController();
  final _gitController = TextEditingController();
  final _linkedinController = TextEditingController();

  String get name => _nameController.text;
  String get phone => _phoneController.text;
  String get email => _emailController.text;
  String get domain => _domainController.text;
  String get cllg => _cllgController.text;
  String get year => _yearController.text;
  String get git => _gitController.text;
  String get link => _linkedinController.text;
  File? imageFile;
  File? resumeFile;
  var isLoading = false;
  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController.text = "";
    _phoneController.text = "";
    _emailController.text = "";
    _gitController.text = "";
    _linkedinController.text = "";
    _cllgController.text = "";
    _domainController.text = "";
    _yearController.text = "";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _gitController.dispose();
    _linkedinController.dispose();
    _cllgController.dispose();
    _domainController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  Future _createProfile(BuildContext ctx) async {
    final auth = FirebaseAuth.instance;
    var userProvider = Provider.of<UserProvider>(ctx, listen: false);
    final isValid = _form.currentState!.validate();
    setState(() {
      isLoading = true;
    });
    _form.currentState!.save();
    if (isValid) {
      if (imageFile == null) {
        print("Please Select Profile Pic");
        setState(() {
          isLoading = false;
        });
      } else {
        await userProvider
            .registerUser(
          Users(
            subId: "",
            name: name,
            phone: phone,
            email: email,
            domain: domain,
            cllg: cllg,
            yearofgrad: year,
            github: git,
            linkedin: link,
            resume: resumeFile!,
            profile: imageFile!,
            id: auth.currentUser!.uid,
          ),
        )
            .catchError((e) {
          print("Failure");
        }).then((_) {
          setState(() {
            isLoading = false;
          });
          Navigator.of(ctx).pushReplacementNamed(UserBottomBar.routeName);
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
      return;
    }
  }

  Future _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Future _getResume() async {
    FilePickerResult? pickedFile = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf', 'doc']);
    if (pickedFile != null) {
      setState(() {
        resumeFile = File(pickedFile.paths[0]!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 22.0, vertical: 0.0),
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
                                _getFromGallery();
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: imageFile == null
                                      ? const Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        )
                                      : const Icon(
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
                      Form(
                        key: _form,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _nameController,
                              hintText: 'Dip Hire',
                              icon: Icons.abc,
                              text: 'Your Full Name *',
                              Ttype: TextInputType.name,
                            ),
                            const SizedBox(height: 10.0),
                            CustomTextField(
                              controller: _phoneController,
                              hintText: '9123456789',
                              icon: Icons.phone,
                              text: 'Your Contact Number *',
                              Ttype: TextInputType.phone,
                            ),
                            const SizedBox(height: 10.0),
                            CustomTextField(
                              controller: _emailController,
                              hintText: 'khoj@gmail.com',
                              icon: Icons.email,
                              text: 'Your Email id *',
                              Ttype: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 10.0),
                            const Divider(),
                            const SizedBox(height: 10.0),
                            CustomTextField(
                              controller: _domainController,
                              hintText: 'Full stack',
                              icon: Icons.work,
                              text: 'Domain your interested in *',
                              Ttype: TextInputType.text,
                            ),
                            const SizedBox(height: 10.0),
                            CustomTextField(
                              controller: _cllgController,
                              hintText: 'D Y Patil Pune',
                              icon: Icons.directions_bus_filled_sharp,
                              text: 'College / University name *',
                              Ttype: TextInputType.text,
                            ),
                            const SizedBox(height: 10.0),
                            CustomTextField(
                              controller: _yearController,
                              hintText: '2024',
                              icon: Icons.school_rounded,
                              text: 'Year of graduation *',
                              Ttype: TextInputType.number,
                            ),
                            const SizedBox(height: 10.0),
                            Divider(),
                            const SizedBox(height: 10.0),
                            CustomTextField(
                              controller: _gitController,
                              hintText: 'github.com/DipHire',
                              icon: Icons.school_rounded,
                              text: 'Your Github profile link ',
                              Ttype: TextInputType.url,
                            ),
                            const SizedBox(height: 10.0),
                            CustomTextField(
                              controller: _linkedinController,
                              hintText: 'linkedin.com/DipHire',
                              icon: Icons.school_rounded,
                              text: 'Your LinkedIn profile link ',
                              Ttype: TextInputType.url,
                            ),
                            const SizedBox(height: 20.0),
                            ElevatedButton(
                              onPressed: _getResume,
                              child: const Text("Upload Resume"),
                            ),
                            const SizedBox(height: 20.0),
                            SizedBox(
                              height: 60, //height of button
                              width: 250, //width of button
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: kprimaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: const EdgeInsets.all(20)),
                                onPressed: () => _createProfile(context),
                                child: const Text(
                                  "Register",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
