import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showSnakBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

String getNameFromEmail(String email) {
  return email.split("@")[0];
}

Future<List<File>> pickImages() async {
  List<File> images = [];
  final picker = ImagePicker();
  final finalfile = await picker.pickMultiImage();
  if (finalfile.isNotEmpty) {
    for (final image in finalfile) {
      images.add(File(image.path));
    }
  }
  return images;
}
