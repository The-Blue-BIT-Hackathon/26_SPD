import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:khoj/constants.dart';

class IntershipDetails extends StatefulWidget {
  const IntershipDetails({super.key});

  @override
  State<IntershipDetails> createState() => _IntershipDetailsState();
}

class _IntershipDetailsState extends State<IntershipDetails> {
  String buttonText = 'Apply';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intership Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kpostColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => NgoProfile(),
                            //   ),
                            // );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              color: const Color(0xffFF0E58),
                              child: Image.asset('assets/images/dp.jpg'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Flutter dev intership',
                                  style: kTextPopM16,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Aikyam Pvt Ltd', style: kTextPopR14),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.share,
                            size: 32.0,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 16),
                    Container(
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.currency_rupee_rounded,
                                    size: 18,
                                  ),
                                  Text(
                                    'Stipend ',
                                    style: kTextPopR14,
                                  ),
                                  Text(
                                    '5k-10k',
                                    style: kTextPopB14,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    FeatherIcons.clock,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 3.0,
                                  ),
                                  Text(
                                    '6-12 Months',
                                    style: kTextPopB14,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.work,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 3.0,
                                  ),
                                  Text(
                                    '5-7 Hrs/day',
                                    style: kTextPopB14,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(color: Colors.transparent),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        FeatherIcons.calendar,
                                        size: 18,
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        'Start Date',
                                        style: kTextPopR14,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Immediate',
                                    style: kTextPopB14,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_rounded,
                                        size: 18,
                                      ),
                                      const SizedBox(
                                        width: 3.0,
                                      ),
                                      Text(
                                        'Location',
                                        style: kTextPopR14,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Pune,India',
                                    style: kTextPopB14,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: kpostColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Job Description',
                          style: kTextPopM16,
                        ),
                        Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget aliquam mauris, in blandit lacus. Duis et pharetra mauris, sit amet fringilla nisi. Nam nec massa eu felis hendrerit rhoncus. Donec aliquam enim eu purus bibendum efficitur. Etiam quis orci at nunc congue sodales id nec augue.',
                            style: kTextPopR14),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: kpostColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Requirements',
                          style: kTextPopM16,
                        ),
                        Text(
                          '- Bachelor\'s degree in Computer Science or related field\n- Familiarity with programming languages such as Java, Python, or C++\n- Excellent problem-solving skills',
                          style: kTextPopR14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: kpostColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About Company',
                          style: kTextPopM16,
                        ),
                        Text(
                          '- Bachelor\'s degree in Computer Science or related field\n- Familiarity with programming languages such as Java, Python, or C++\n- Excellent problem-solving skills',
                          style: kTextPopR14,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              buttonText = 'Applied';
                            });
                          },
                          child: Text(buttonText),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
