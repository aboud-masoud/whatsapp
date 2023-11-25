import 'package:flutter/material.dart';
import 'package:whatsapp/chat_details_screen.dart';
import 'package:whatsapp/model/contact.dart';
import 'package:whatsapp/widgets/contact_tile.dart';
import 'package:whatsapp/widgets/search_view.dart';

class ChatView extends StatefulWidget {
  final double scrollPosition;
  final ScrollController scrollController;
  const ChatView({super.key, required this.scrollPosition, required this.scrollController});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<Contact> contactList = [
    Contact(
        image: "https://buffer.com/library/content/images/2022/03/amina.png",
        name: "Layla hasson",
        desc: "desc 1",
        date: "10.00 PM"),
    Contact(
        image:
            "https://media.istockphoto.com/id/1351147752/photo/studio-portrait-of-attractive-20-year-old-bearded-man.jpg?s=612x612&w=0&k=20&c=-twL1NKKad6S_EPrGSniewjh6776A0Ju27ExMh7v_kI=",
        name: "sawsan ahmed",
        desc: "desc 2",
        date: "1.00 PM"),
    Contact(
        image: "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
        name: "izz shaheen",
        desc: "desc 3",
        date: "12.00 PM"),
    Contact(
        image: "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
        name: "izz shaheen",
        desc: "desc 3",
        date: "12.00 PM"),
    Contact(
        image: "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
        name: "izz shaheen",
        desc: "desc 3",
        date: "12.00 PM"),
    Contact(
        image: "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
        name: "izz shaheen",
        desc: "desc 3",
        date: "12.00 PM"),
    Contact(
        image: "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
        name: "izz shaheen",
        desc: "desc 3",
        date: "12.00 PM"),
    Contact(
        image: "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
        name: "izz shaheen",
        desc: "desc 3",
        date: "12.00 PM"),
    Contact(
        image: "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
        name: "izz shaheen",
        desc: "desc 3",
        date: "12.00 PM"),
    Contact(
        image: "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
        name: "izz shaheen",
        desc: "desc 3",
        date: "12.00 PM"),
    Contact(
        image: "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
        name: "izz shaheen",
        desc: "desc 3",
        date: "12.00 PM"),
    Contact(
        image: "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
        name: "izz shaheen",
        desc: "desc 3",
        date: "12.00 PM"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.scrollPosition == 0 ? const SearchView() : Container(),
        const Divider(),
        Expanded(
          child: ListView.builder(
              itemCount: contactList.length,
              controller: widget.scrollController,
              itemBuilder: (context, index) {
                return InkWell(
                  child: ContactTile(
                    contact: contactList[index],
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                      return ChatDetailsScreen(
                        image: contactList[index].image,
                        name: contactList[index].name,
                      );
                    }));
                  },
                );
              }),
        )
      ],
    );
  }
}
