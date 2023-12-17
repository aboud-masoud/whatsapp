import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/utils/bottom_sheet.dart';
import 'package:whatsapp/utils/firebase_storage.dart';
import 'package:path/path.dart';

class SendMessageView extends StatefulWidget {
  final Function(String) onTapSend;
  const SendMessageView({super.key, required this.onTapSend});

  @override
  State<SendMessageView> createState() => _SendMessageViewState();
}

class _SendMessageViewState extends State<SendMessageView> {
  TextEditingController controller = TextEditingController();

  Future<File> pickImageMeth(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    return File(image?.path ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                BottomSheetUtil().addImageBottomSheet(context, galleryCallBack: () async {
                  final image = await pickImageMeth(ImageSource.gallery);
                  String fileName = basename(image.path);

                  await MyFirebaseStorage().uplaodFile(fileName: fileName, file: image);

                  final url = await MyFirebaseStorage().getDownloadURL(fileName);
                  widget.onTapSend(url);
                }, cameraCallBack: () async {
                  final image = await pickImageMeth(ImageSource.camera);
                  String fileName = basename(image.path);

                  await MyFirebaseStorage().uplaodFile(fileName: fileName, file: image);

                  final url = await MyFirebaseStorage().getDownloadURL(fileName);
                  widget.onTapSend(url);
                });
              },
              icon: const Icon(
                Icons.add,
                color: Colors.blue,
                size: 40,
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 40,
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        widget.onTapSend(controller.text);
                        controller.text = "";
                      },
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
