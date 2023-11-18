import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  'https://media.istockphoto.com/id/1300512215/photo/headshot-portrait-of-smiling-ethnic-businessman-in-office.jpg?s=612x612&w=0&k=20&c=QjebAlXBgee05B3rcLDAtOaMtmdLjtZ5Yg9IJoiy-VY='),
              backgroundColor: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Abed alrahman al hajj",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
