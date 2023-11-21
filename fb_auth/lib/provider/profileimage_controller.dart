import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController with ChangeNotifier {
  TextEditingController username = TextEditingController();
  FilePickerResult? pickedfile;
  Uint8List? webImage;
  File? image;
  final User? _user = FirebaseAuth.instance.currentUser;

  pickImage() async {
    pickedfile = await FilePicker.platform.pickFiles(type: FileType.image);
    if (pickedfile != null) {
      kIsWeb
          ? webImage = pickedfile!.files.single.bytes
          : image = File(pickedfile!.files.single.path!);
      notifyListeners();
    } else {
      mySnackbar('No Image selected');
    }
  }

  updateProfile() async {
    if (image != null || webImage != null) {
      try {
        storage.FirebaseStorage fbStorage = storage.FirebaseStorage.instance;
        storage.Reference refRoot =
            fbStorage.ref().child('user-profile-images');
        storage.Reference ref =
            refRoot.child('image-profilephoto_${_user!.uid}.jpg');

        if (pickedfile != null) {
          mySnackbar('uploading...');
          kIsWeb
              ? await ref.putData(pickedfile!.files.single.bytes!)
              : await ref.putFile(File(pickedfile!.files.single.path!));
          String imageURL = await ref.getDownloadURL();
          await _user!.updatePhotoURL(imageURL);
          await _user!.updateDisplayName(username.text.trim());
          mySnackbar('Profile Updated');
        } else {
          mySnackbar('No Image Selected!');
        }
      } on FirebaseException {
        mySnackbar('Firebase error occured!');
      } catch (e) {
        mySnackbar('something unexpected occured!');
      }
    }
  }

  mySnackbar(String text) async {
    Get.closeAllSnackbars();
    Get.rawSnackbar(message: text);
  }
}
