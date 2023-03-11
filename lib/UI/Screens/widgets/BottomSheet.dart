import 'package:flutter/material.dart';
import 'package:khoj/UI/Screens/widgets/PostItem.dart';

import '../../../constants.dart';

Widget bottomSheet() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      color: Colors.white,
    ),
    height: 700, // adjust height as per your requirement
    child: ListView(
      shrinkWrap: true,
      children: [
        // PostItem(
        //     title: title,
        //     companyName: companyName,
        //     location: location,
        //     salary: salary,
        //     duration: duration,
        //     dailyhrs: dailyhrs,
        //     startDate: startDate,
        //     applyStatus: applyStatus,
        //     pid: pid,
        //     cid: cid),
        skills(),
      ],
    ),
  );
}

class About extends StatelessWidget {
  final List<String> bulletPoints = [
    "The SEO analyst should quickly understand and support initiatives that will contribute to the goals and success of client campaigns and our own campaign.",
    "You have to manage following SEO activities, Content Strategy, Keyword Strategy and Link Building to increase rankings, traffic and leads on all major search engines.",
    "Analyzing results on Google Analytics.",
    "Monitor and report on metrics on daily, weekly and monthly.",
    "Analyze the reports and come up with a new plan or strategy to move next Level.",
    "Unique error-free description to create for SMM post",
    "Required Experience, Skills and Qualifications",
    "Qualifications-Any Graduate",
    "Experience-freshers",
    "Content Writing. Required Experience, Skills and Qualifications",
    "Basic knowledge about SEO.",
    "Good Communication Skills",
    "Ability to learn new concepts",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
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
              'About Intership',
              style: kTextPopB14,
            ),
            Text('Responsibilities and Duties'),
            ListView.builder(
              itemCount: bulletPoints.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          bulletPoints[index],
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class skills extends StatelessWidget {
  const skills({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
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
              'Mandatory Skills',
              style: kTextPopB14,
            ),
            Text(''),
            Chip(
              label: Text('flutter'),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            ),
            Chip(
              label: Text('Java'),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            ),
            Chip(
              label: Text('figma'),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            ),
            Chip(
              label: Text('firebase'),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            ),
          ],
        ),
      ),
    );
  }
}
