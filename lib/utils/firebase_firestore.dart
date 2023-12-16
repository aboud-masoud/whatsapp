import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyFirebaseFirestore {
  final CollectionReference groupsCollection = FirebaseFirestore.instance.collection('groups');

  Future<void> createNewGroup(BuildContext context) async {
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerImage = TextEditingController();

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: controllerName,
                  decoration: const InputDecoration(labelText: 'Group Name'),
                ),
                TextField(
                  controller: controllerImage,
                  decoration: const InputDecoration(labelText: 'Group Image URL'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('create'),
                  onPressed: () async {
                    if (controllerName.text.isNotEmpty && controllerImage.text.isNotEmpty) {
                      await groupsCollection.add({"name": controllerName.text, "image": controllerImage.text});
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }
}
