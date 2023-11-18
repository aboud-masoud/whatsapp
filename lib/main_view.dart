import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/search_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

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
          const SearchView(),
          const Divider(),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return SizedBox(
                height: 50,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://media.istockphoto.com/id/1300512215/photo/headshot-portrait-of-smiling-ethnic-businessman-in-office.jpg?s=612x612&w=0&k=20&c=QjebAlXBgee05B3rcLDAtOaMtmdLjtZ5Yg9IJoiy-VY='),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
