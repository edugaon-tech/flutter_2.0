import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class UploadImage {
  var storage = FirebaseStorage.instance;

  upload() {
    var image = "fadfhsfs.png";
    var imageType = image.split(".").last;
    var a = storage.ref("images").child("path").putFile(
        File("path"), SettableMetadata(contentType: "image/$imageType"));
  }
}
