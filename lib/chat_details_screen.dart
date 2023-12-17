import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/utils/firebase_firestore.dart';
import 'package:whatsapp/widgets/send_message_view.dart';

String userEmail = "";

class ChatDetailsScreen extends StatefulWidget {
  final String image;
  final String name;
  const ChatDetailsScreen({super.key, required this.image, required this.name});

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  String documentId = "";
  List<dynamic> chat = [];

  ScrollController scrollController = ScrollController();

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
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Expanded(
                child: StreamBuilder(
                    stream: MyFirebaseFirestore().groupsCollection.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.hasData) {
                        for (var item in streamSnapshot.data!.docs) {
                          if (item["name"] == widget.name) {
                            documentId = item.id;
                            chat = item["chat"];
                          }
                        }

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              controller: scrollController,
                              itemCount: chat.length,
                              itemBuilder: (ctx, index) {
                                final userName = chat[index]["name"].toString().split("@").first;
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment: chat[index]["name"].toString() == userEmail
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.end,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    userName,
                                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                  chat[index]["text"].toString().contains("http")
                                                      ? Image.network(
                                                          chat[index]["text"],
                                                          width: 200,
                                                        )
                                                      : Text(chat[index]["text"], maxLines: 10),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
              SendMessageView(
                onTapSend: (value) {
                  chat.add({"name": userEmail, "text": value});
                  MyFirebaseFirestore()
                      .groupsCollection
                      .doc(documentId)
                      .update({"name": widget.name, "image": widget.image, "chat": chat});
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent + 50,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 300),
                  );
                  FocusScope.of(context).unfocus();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
