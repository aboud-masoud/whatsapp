import 'package:flutter/material.dart';
import 'package:whatsapp/utils/firebase_firestore.dart';
import 'package:whatsapp/widgets/groups_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: TextButton(
            child: const Text("Edit"),
            onPressed: () {},
          ),
          title: const Text("Groups"),
          actions: [
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline_sharp),
              onPressed: () {
                MyFirebaseFirestore().createNewGroup(context);
              },
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            Center(
                child: Text(
              'Welcome to Update Tab',
              style: TextStyle(fontSize: 32),
            )),
            Center(
                child: Text(
              'Welcome to calls Tab',
              style: TextStyle(fontSize: 32),
            )),
            Center(
                child: Text(
              'Welcome to Communities Tab',
              style: TextStyle(fontSize: 32),
            )),
            GroupsView(),
            Center(
                child: Text(
              'Welcome to Settings Tab',
              style: TextStyle(fontSize: 32),
            )),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            color: Colors.red,
            child: const TabBar(
              indicatorWeight: 5.0,
              labelColor: Colors.white,
              labelPadding: EdgeInsets.only(top: 10.0),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: 'Update',
                  icon: Icon(
                    Icons.update,
                    color: Colors.white,
                  ),
                  iconMargin: EdgeInsets.only(bottom: 10.0),
                ),
                Tab(
                  text: 'Calls',
                  icon: Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  iconMargin: EdgeInsets.only(bottom: 10.0),
                ),
                Tab(
                  text: 'Communites',
                  icon: Icon(
                    Icons.group,
                    color: Colors.white,
                  ),
                  iconMargin: EdgeInsets.only(bottom: 10.0),
                ),
                Tab(
                  text: 'Groups',
                  icon: Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                  iconMargin: EdgeInsets.only(bottom: 10.0),
                ),
                Tab(
                  text: 'Settings',
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  iconMargin: EdgeInsets.only(bottom: 10.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
