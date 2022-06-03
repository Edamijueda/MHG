// This class wraps the functionality for the image_picker package so that we don't
// have dependencies outside of this class on that package
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageSelector {

  final ImagePicker _picker = ImagePicker();

  Future<XFile?> selectImage() async {
    //return await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}
