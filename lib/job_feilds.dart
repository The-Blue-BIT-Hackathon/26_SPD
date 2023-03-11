import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<Map<String, dynamic>> jobDetails = [
    {
      "id": 1,
      "Company ID": "TechESteel",
      "Salary": "2-4 LPA",
      "Job Title": "Business Development Intern",
      "City": "Mumbai",
      "State": "Maharashtra",
      "Duration": "4 months",
      "Location": "On-Site",
      "Daily Working Hours": "5 hours",
      "Responsibility": [
        "Assist new customers with onboarding process",
        "Maintain & provide daily or weekly reports to management",
        "Assist in marketing activities"
      ],
      "Skills Required": [
        "Employee needs to open to learning new work & dedicated",
        "Employee needs to be good at communication"
      ],
    },
    {
      "id": 2,
      "Company ID": "KarmaPoints",
      "Salary": "5-7 LPA",
      "Job Title": "Social Media Marketing",
      "City": "Mumbai",
      "State": "Maharashtra",
      "Duration": "3 months",
      "Location": "Work Frome Home",
      "Daily Working Hours": "7 hours",
      "Responsibility": [
        "Develop social media strategy",
        "Create original content",
        "Growing social media channels organically"
      ],
      "Skills Required": [
        "Growth Mindset",
        "Content Creation",
        "Influencer Marketing",
        "Instagram Marketing"
      ],
    },
    {
      "id": 3,
      "Company ID": "Kaveri Pvt",
      "Salary": "7-9 LPA",
      "Job Title": "Backend Developer",
      "City": "Lucknow",
      "State": "Uttar Pradesh",
      "Duration": "6 months",
      "Location": "Work From Home",
      "Daily Working Hours": "7 hours",
      "Responsibility": [
        "Strong knowledge of Python",
        "Working experience in developing Web Applications using Django/Flask",
        "Good working experience in databases and can write advanced SQL queries",
        "Having worked on asynchronous programming models like rabbitmq, celery, etc. will be a plus",
        "Working knowledge of HTML, CSS, and other web technologies"
            "Knowledge of Redis or Memcache as caching stores is a plus"
      ],
      "Skills Required": ["API", "Django", "Python", "Node.Js", "MongoDB"],
    },
    {
      "id": 4,
      "Company ID": "Mobile App Developer Job",
      "Salary": "6-7 LPA",
      "Job Title": "Sigma Infosolutions",
      "City": "Bangalore",
      "State": "Karnataka",
      "Duration": "6 months",
      "Location": "In -Office",
      "Daily Working Hours": "5-7 hours",
      "Responsibility": [
        "Identifies business opportunities by researching and analyzing sales options",
        " Profile strategic accounts identifying key individuals,and obtaining business requirements and presenting solutions to start the sales cycle"
      ],
      "Skills Required": [
        "Market Research",
        "Lead Generation",
        "Attention to Detail",
        "Time Management",
        "Strong Communication Skills - Written & Verbal",
        "Creativity",
        "Quick Learner",
        "Prospecting",
        "MS Office",
        "CRM"
      ],
    },
    {
      "id": 5,
      "Company ID": "SportsBunker",
      "Salary": "5 LPA",
      "Job Title": "Fullstack Developer Job",
      "City": "Bangalore",
      "State": "Karnataka",
      "Duration": "8 months",
      "Location": "On-Site",
      "Daily Working Hours": "8-9 hours",
      "Responsibility": [
        "Architect brand-new software solutions to fulfill project requirements",
        "Create, design, and implement layouts for new and existing web pages",
        "Create and maintain database designs for data storage and processing",
        "Integrate external software libraries and APIs into existing projects"
      ],
      "Skills Required": [
        "Angular",
        "React.js",
        "NodeJs",
        "MS SQL",
        "MongoDB",
        "CSS",
        "HTML"
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Job Map List')),
            body: ListView.builder(
                itemCount: jobDetails.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 85,
                    margin: const EdgeInsets.all(2),
                    color: Color.fromARGB(214, 196, 196, 196),
                    child: Center(
                        child: Text(
                      '${jobDetails[index]["Company ID"]["Salary"]["Job Title"]["City"]["State"]["Duration"]["Location"]["Daily Working Hours"]["Responsibility"]["Skills Required"]}',
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    )),
                  );
                })));
  }
}
