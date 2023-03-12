import 'package:flutter/material.dart';
import 'package:khoj/UI/Screens/User/UchatScreenOpen.dart';
import 'package:khoj/UI/Screens/widgets/chatUser.dart';
import 'package:khoj/UI/Screens/widgets/roundedappBar.dart';

class UChatScreen extends StatelessWidget {
  const UChatScreen({super.key});

  static const routeName = '/chat_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 80,
          flexibleSpace: RoundAppBar(
            title: 'Chat',
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: ListView(
              children: [
                ChatListItem(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreenOpen()),
                    );
                  },
                  name: 'Google',
                  message: 'Hii I would like to ..',
                  isOnline: true,
                  imageUrl: 'assets/images/ngo.png',
                ),
                ChatListItem(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreenOpen()),
                    );
                  },
                  name: 'Google',
                  message: 'Hii I would like to ..',
                  isOnline: true,
                  imageUrl: 'assets/images/ngo.png',
                ),
                ChatListItem(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreenOpen()),
                    );
                  },
                  name: 'Google',
                  message: 'Hii I would like to ..',
                  isOnline: true,
                  imageUrl: 'assets/images/ngo.png',
                ),
                ChatListItem(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreenOpen()),
                    );
                  },
                  name: 'Google',
                  message: 'Hii I would like to ..',
                  isOnline: true,
                  imageUrl: 'assets/images/ngo.png',
                ),
                ChatListItem(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreenOpen()),
                    );
                  },
                  name: 'Google',
                  message: 'Hii I would like to ..',
                  isOnline: true,
                  imageUrl: 'assets/images/ngo.png',
                ),
                ChatListItem(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreenOpen()),
                    );
                  },
                  name: 'Google',
                  message: 'Hii I would like to ..',
                  isOnline: true,
                  imageUrl: 'assets/images/ngo.png',
                ),
                ChatListItem(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreenOpen()),
                    );
                  },
                  name: 'Google',
                  message: 'Hii I would like to ..',
                  isOnline: true,
                  imageUrl: 'assets/images/ngo.png',
                ),
                ChatListItem(
                  onTap: () {},
                  name: 'Dip',
                  message: 'Its 4 am im doin this shit',
                  isOnline: false,
                  imageUrl: 'assets/images/profile.png',
                ),
                ChatListItem(
                  onTap: () {},
                  name: 'Smile Foundation',
                  message: 'Hii I would like to ..',
                  isOnline: true,
                  imageUrl: 'assets/images/ngo.png',
                ),
                ChatListItem(
                  onTap: () {},
                  name: 'Dip',
                  message: 'Its 4 am im doin this shit',
                  isOnline: false,
                  imageUrl: 'assets/images/profile.png',
                ),
                ChatListItem(
                  onTap: () {},
                  name: 'Dip',
                  message: 'Its 4 am im doin this shit',
                  isOnline: false,
                  imageUrl: 'assets/images/profile.png',
                ),
                ChatListItem(
                  onTap: () {},
                  name: 'Dip',
                  message: 'Its 4 am im doin this shit',
                  isOnline: false,
                  imageUrl: 'assets/images/profile.png',
                ),
                ChatListItem(
                  onTap: () {},
                  name: 'Elon Musk',
                  message: '',
                  isOnline: false,
                  imageUrl: 'assets/images/profile.png',
                ),
                ChatListItem(
                  onTap: () {},
                  name: 'Smile Foundation',
                  message: 'Hii I would like to ..',
                  isOnline: true,
                  imageUrl: 'assets/images/ngo.png',
                ),
                ChatListItem(
                  onTap: () {},
                  name: 'Smile Foundation',
                  message: 'Hii I would like to ..',
                  isOnline: true,
                  imageUrl: 'assets/images/ngo.png',
                ),
                ChatListItem(
                  onTap: () {},
                  name: 'Smile Foundation',
                  message: 'Hii I would like to ..',
                  isOnline: true,
                  imageUrl: 'assets/images/ngo.png',
                ),
                ChatListItem(
                  onTap: () {},
                  name: 'Smile Foundation',
                  message: 'Hii I would like to ..',
                  isOnline: true,
                  imageUrl: 'assets/images/ngo.png',
                ),
                ChatListItem(
                  onTap: () {},
                  name: 'Smile Foundation',
                  message: 'Hii I would like to ..',
                  isOnline: true,
                  imageUrl: 'assets/images/dp.jpg',
                ),
                ChatListItem(
                  onTap: () {},
                  name: 'Smile Foundation',
                  message: 'Hii I would like to ..',
                  isOnline: true,
                  imageUrl: 'assets/images/dp.jpg',
                ),
                ChatListItem(
                  onTap: () {},
                  name: 'Smile Foundation',
                  message: 'Hii I would like to ..',
                  isOnline: true,
                  imageUrl: 'assets/images/dp.jpg',
                ),
                ChatListItem(
                  onTap: () {},
                  name: 'Elon Musk',
                  message: '',
                  isOnline: false,
                  imageUrl: 'assets/images/profile.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
