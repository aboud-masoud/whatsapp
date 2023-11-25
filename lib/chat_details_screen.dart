import 'package:flutter/material.dart';
import 'package:whatsapp/model/chat.dart';
import 'package:whatsapp/widgets/send_message_view.dart';

class ChatDetailsScreen extends StatefulWidget {
  final String image;
  final String name;
  const ChatDetailsScreen({super.key, required this.image, required this.name});

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  List<Chat> chatList = [
    Chat(message: "hi", myMessage: false),
    Chat(message: "hello", myMessage: true),
    Chat(message: "abeed ?", myMessage: false),
    Chat(message: "No barqawi", myMessage: true),
    Chat(message: "Lorem Ipsum is simply dummy text of the is simply dummy text of the", myMessage: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(widget.image),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(fontSize: 14),
                ),
                const Text(
                  "tap here for contact info",
                  style: TextStyle(fontSize: 10, color: Color(0xff444444)),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.video_call),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/background.jpg",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: chatList.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                      child: Row(
                        mainAxisAlignment: chatList[index].myMessage ? MainAxisAlignment.start : MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                color: chatList[index].myMessage ? Colors.white : Colors.grey,
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(chatList[index].message, maxLines: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
      bottomNavigationBar: SendMessageView(
        onTapSend: (value) {
          chatList.add(Chat(message: value, myMessage: true));
          setState(() {});
        },
      ),
    );
  }
}
