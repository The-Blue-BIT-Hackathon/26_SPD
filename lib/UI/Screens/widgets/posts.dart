import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:khoj/UI/Screens/widgets/BottomSheet.dart';
import 'package:khoj/UI/Screens/widgets/viewPost.dart';
import '../../../constants.dart';

class Post extends StatefulWidget {
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
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
                            'Remote',
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
