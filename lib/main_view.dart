import 'package:flutter/material.dart';

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
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              height: 45,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  fillColor: Color(0xffD3D3D3),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
