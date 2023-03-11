import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:khoj/UI/Screens/widgets/BottomSheet.dart';
import 'package:khoj/UI/Screens/widgets/viewPost.dart';
import '../../../constants.dart';

class PostItem extends StatefulWidget {
  final String title;
  final String companyName;
  final String location;
  final String salary;
  final String duration;
  final String dailyhrs;
  final String startDate;
  final String applyStatus;
  final String pid;
  final String cid;

  const PostItem({
    required this.title,
    required this.companyName,
    required this.location,
    required this.salary,
    required this.duration,
    required this.dailyhrs,
    required this.startDate,
    required this.applyStatus,
    required this.pid,
    required this.cid,
  });

  @override
  State<PostItem> createState() => _PostState();
}

class _PostState extends State<PostItem> {
  bool _isExpanded = true;
  bool _isLike = true;
  bool _isApply = true;

  void toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void toggleLike() {
    setState(() {
      _isLike = !_isLike;
    });
  }

  void toggleApply() {
    setState(() {
      _isApply = !_isApply;
    });
  }

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(initialPage: 0);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          style: kTextPopM16.merge(TextStyle(fontSize: 10)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(widget.companyName, style: kTextPopR14),
                        Text(' | ', style: kTextPopR14),
                        Text('Pune', style: kTextPopR14),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.currency_rupee_rounded,
                            size: 18,
                          ),
                          Text(
                            widget.salary,
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
                            widget.duration,
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
                            widget.dailyhrs,
                            style: kTextPopB14,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(color: Colors.transparent),
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
                            widget.startDate,
                            style: kTextPopB14,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                FeatherIcons.map,
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
                            widget.location,
                            style: kTextPopB14,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                // GestureDetector(
                //   onTap: toggleLike,
                //   child: Container(
                //     padding: const EdgeInsets.all(8.0),
                //     child: _isLike
                //         ? Icon(
                //             Icons.bookmark_outlined,
                //             color: kprimaryColor,
                //           )
                //         : Icon(
                //             Icons.bookmark_border_rounded,
                //             color: kprimaryColor,
                //           ),
                //   ),
                // ),
                Expanded(
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IntershipDetails()));
                      },
                      child: Text("view")),
                ),

                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        toggleApply();
                      });
                    },
                    child: Text(
                      _isApply ? 'Apply' : 'Withdrow',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
