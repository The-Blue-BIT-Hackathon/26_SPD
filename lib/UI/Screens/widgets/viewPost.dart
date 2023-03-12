import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:khoj/constants.dart';
import 'package:khoj/models/post.dart';
import 'package:khoj/providers/post_provider.dart';
import 'package:provider/provider.dart';

class InternshipDetails extends StatefulWidget {
  final String pid;

  const InternshipDetails({required this.pid});

  @override
  State<InternshipDetails> createState() => _InternshipDetailsState();
}

class _InternshipDetailsState extends State<InternshipDetails> {
  String buttonText = 'Apply';
  Post? post;
  var isLoading = true;
  var isInit = false;

  @override
  void didChangeDependencies() {
    if (!isInit) {
      _fetchbyId(widget.pid);
    }
    isInit = true;
    super.didChangeDependencies();
  }

  Future _fetchbyId(String pid) async {
    Post p = await Provider.of<PostProvider>(context)
        .fetchPostById(pid)
        .catchError((e) {
      print("Failure");
    });
    setState(() {
      post = p;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internship Details'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16.0),
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
                                onTap: () {},
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 200,
                                        child: Flexible(
                                          child: Text(
                                            post?.title == null
                                                ? ""
                                                : post!.title,
                                            style: kTextPopM16,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        post?.cname == null ? "" : post!.cname,
                                        style: kTextPopR14,
                                      ),
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
                          Column(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        post!.lsalary,
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
                                        post?.workinghrs == null
                                            ? ""
                                            : post!.workinghrs,
                                        style: kTextPopB14,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(color: Colors.transparent),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                        post?.startDate == null
                                            ? ""
                                            : post!.startDate,
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
                                        post?.location == null
                                            ? ""
                                            : post!.location,
                                        style: kTextPopB14,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
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
                            'Skills Required',
                            style: kTextPopM16,
                          ),
                          Text(
                            post?.skills[0] == null ? "" : post!.skills[0],
                            style: kTextPopR14,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
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
                                post?.responsibility[0] == null
                                    ? ""
                                    : post!.responsibility[0],
                                style: kTextPopR14,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
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
                        const SizedBox(height: 10.0),
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
