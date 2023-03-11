import 'package:flutter/material.dart';
import 'package:khoj/UI/Screens/widgets/roundedappBar.dart';

class UCourseScreen extends StatelessWidget {
  const UCourseScreen({super.key});

  static const routeName = '/course_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          flexibleSpace: RoundAppBar(
            title: 'Course',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}
