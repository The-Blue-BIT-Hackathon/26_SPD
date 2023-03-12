import 'package:flutter/material.dart';
import 'package:khoj/UI/Screens/widgets/roundedappBar.dart';

class NActivityScreen extends StatelessWidget {
  const NActivityScreen({super.key});

  static const routeName = '/activity_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 80,
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
