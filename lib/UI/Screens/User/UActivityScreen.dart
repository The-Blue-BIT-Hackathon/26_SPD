import 'package:flutter/material.dart';
import 'package:khoj/UI/Screens/widgets/roundedappBar.dart';

class UActivityScreen extends StatelessWidget {
  const UActivityScreen({super.key});

  static const routeName = '/activity_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          flexibleSpace: RoundAppBar(
            title: 'Activity',
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
