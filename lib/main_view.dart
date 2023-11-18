import 'package:flutter/material.dart';
import 'package:whatsapp/chat_details_screen.dart';
import 'package:whatsapp/model/contact.dart';
import 'package:whatsapp/widgets/contact_tile.dart';
import 'package:whatsapp/widgets/search_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
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
  ScrollController scrollController = ScrollController();
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: TextButton(
            child: const Text("Edit"),
            onPressed: () {},
          ),
          title: const Text("Chat"),
          actions: [
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline_sharp),
              onPressed: () {},
            ),
          ]),
      body: Column(
        children: [
          _scrollPosition == 0 ? const SearchView() : Container(),
          const Divider(),
          Expanded(
            child: ListView.builder(
                itemCount: contactList.length,
                controller: scrollController,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: ContactTile(
                      contact: contactList[index],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                        return const ChatDetailsScreen();
                      }));
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
