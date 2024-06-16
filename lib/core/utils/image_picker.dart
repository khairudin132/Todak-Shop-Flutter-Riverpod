import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImage() async {
  try {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  } on PlatformException {
    rethrow;
  }
}
