import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:whatsapp/chat_details_screen.dart';
import 'package:whatsapp/model/contact.dart';
import 'package:whatsapp/utils/firebase_firestore.dart';
import 'package:whatsapp/widgets/contact_tile.dart';
import 'package:whatsapp/widgets/search_view.dart';

class GroupsView extends StatefulWidget {
  const GroupsView({super.key});

  @override
  State<GroupsView> createState() => _GroupsViewState();
}

class _GroupsViewState extends State<GroupsView> {
  ScrollController scrollController = ScrollController();
  double scrollPosition = 0;

  _scrollListener() {
    setState(() {
      scrollPosition = scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        scrollPosition == 0 ? const SearchView() : Container(),
        const Divider(),
        Expanded(
          child: StreamBuilder(
              stream: MyFirebaseFirestore().groupsCollection.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                      itemCount: streamSnapshot.data!.docs.length,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                        return InkWell(
                          child: ContactTile(
                            contact: Contact(
                              image: documentSnapshot["image"],
                              name: documentSnapshot["name"],
                            ),
                          ),
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                            //   return ChatDetailsScreen(
                            //     // image: contactList[index].image,
                            //     // name: contactList[index].name,
                            //   );
                            // }));
                          },
                        );
                      });
                } else {
                  return Container();
                }
              }),
        )
      ],
    );
  }
}
