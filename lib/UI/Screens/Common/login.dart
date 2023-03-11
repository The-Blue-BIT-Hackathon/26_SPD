import 'package:flutter/material.dart';
import 'package:khoj/UI/Screens/Common/otp.dart';
import 'package:khoj/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);
  static var routeName = "/login";

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _phoneController = TextEditingController();
  String get phoneNo => "+91${_phoneController.text}";
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _phoneController.text = "";
  }

  Future _sendOtp(BuildContext ctx) async {
    var isValid = false;
    isLoading = true;
    if (phoneNo.length == 13) {
      await Provider.of<Auth>(ctx, listen: false)
          .authenticate(phoneNo)
          .catchError((e) {
        print("Failure");
      }).then((value) => Navigator.of(context).pushNamed(OtpScreen.routeName));
    } else {
      print("Failure");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 45.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 280.0,
                        child: Lottie.asset('assets/animation/animation5.json'),
                      ),
                      const Center(
                        child: Text("Login/ Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone),
                          hintText: 'Enter Your Mobile Number',
                          counterText: "",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => _sendOtp(context),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(300, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: kprimaryColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            textStyle: const TextStyle(
                              fontSize: 18,
                            )),
                        child: const Text('Generate OTP'),
                        // label: const Text('Plus One'),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
