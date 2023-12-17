import 'package:flutter/material.dart';

class BottomSheetUtil {
  Future addImageBottomSheet(BuildContext context,
      {required VoidCallback galleryCallBack, required VoidCallback cameraCallBack}) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        context: context,
        builder: (context) {
          return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("select Image source"),
                  const SizedBox(height: 27.0),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      galleryCallBack();
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.image,
                          color: Color(0xff4CB6EA),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Gallary",
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();

                      cameraCallBack();
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.camera,
                          color: Color(0xff4CB6EA),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Camera",
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.cancel,
                          color: Color(0xff4CB6EA),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Cancel",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                ],
              ));
        });
  }
}
