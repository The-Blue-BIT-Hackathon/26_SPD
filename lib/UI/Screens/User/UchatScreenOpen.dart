import 'package:flutter/material.dart';
import 'package:khoj/UI/Screens/widgets/chatBouble.dart';

import '../../../constants.dart';

class ChatScreenOpen extends StatefulWidget {
  const ChatScreenOpen({Key? key}) : super(key: key);

  @override
  _ChatScreenOpenState createState() => _ChatScreenOpenState();
}

class _ChatScreenOpenState extends State<ChatScreenOpen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        height: 70.0,
                        width: 70.0,
                        color:Colors.red,
                        child: Image.asset('assets/images/ngo.png'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Smile Foundation',
                            style: kTextPopM16),
                        Text(
                          'Active 5 mins ago',
                          style: kTextPopR12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                children: [
                  MessageBubble(
                    sender: '',
                    text:
                        'Lorem Ipsum is simply dummy text of the printing and sdjfjsdbf Lorem Ipsum is simply dummy text of the printing and Lorem Ipsum is simply dummy text of the printing simply dummy text of the printing and sdjfjsdbf',
                    isUser: false,
                  ),
                  MessageBubble(
                    sender: '',
                    text: 'Its on Sunday 12 onwords',
                    isUser: false,
                  ),
                  MessageBubble(
                    sender: ' ',
                    text: 'Hey, What is the time ?, What is the ',
                    isUser: true,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            String message = _textController.text.trim();
                            if (message.isNotEmpty) {
                              _textController.clear();
                              setState(() {});
                            }
                          },
                        ),
                        hintText: 'Message',hintStyle: kTextPopR14,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 2, color: kprimaryColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
