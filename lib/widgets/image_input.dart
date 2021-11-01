import 'dart:io';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 140,
          height: 110,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                )
              : const Text(
                  "No Image Taken",
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.photo_camera),
              label: const Text("Take Picture"),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
