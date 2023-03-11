import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../constants.dart';

class introOne extends StatelessWidget {
  const introOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Column(
          children: [
            SizedBox(
              height: 280.0,
              child: Lottie.asset('assets/animation/animation3.json'),
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur dolor sit amet, consectetur",
              style: kTextPopB16,
              textAlign: TextAlign.center,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur ",
              style: kTextPopR14,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
