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
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Container();
            }),
          )
        ],
      ),
    );
  }
}
