import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController with ChangeNotifier {
  File? image;
  Uint8List? webImage;
  String imageURL = '';

  final storage.FirebaseStorage _storage = storage.FirebaseStorage.instance;
  final User? _user = FirebaseAuth.instance.currentUser;

  void pickImageLayout(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              contentPadding: const EdgeInsets.symmetric(vertical: 4),
              content: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text('Camera'),
                  onTap: () => _pickImage(source: ImageSource.camera),
                ),
                ListTile(
                    leading: const Icon(Icons.photo),
                    title: const Text('Gallery'),
                    onTap: () => _pickImage(source: ImageSource.gallery))
              ]));
        });
  }

  void pickImageWeb() async {
    try {
      final file = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: false);
      var pickedImage = file!.files.first;
      webImage = pickedImage.bytes;
      image = File(pickedImage.path!);
      notifyListeners();
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _pickImage({required ImageSource source}) async {
    try {
      final file = await ImagePicker().pickImage(source: source);
      if (file != null) {
        image = File(file.path);
        Get.back();
        notifyListeners();
      } else {
        Get.back();
        notifyListeners();
        Get.rawSnackbar(message: 'No file selected.');
      }
    } catch (e) {
      debugPrint('Error: $e');
      Get.rawSnackbar(message: 'Something went wrong, try again.');
      Get.back();
    }
  }

  Future uploadImage() async {
    storage.Reference reference = _storage
        .ref()
        .child('user-profile-images/profile-uid:${_user!.uid}.jpg');
    debugPrint('uploading to ${reference.bucket}');

    try {
      if (image != null) {
        debugPrint('uploading....');
        await reference.putFile(File(image!.path)).then((p0) async {
          debugPrint('Uploading Sucess');
          imageURL = await reference.getDownloadURL();
          debugPrint('storage image url: $imageURL');
          await _user!.updatePhotoURL(imageURL);
        });
      }
    } on FirebaseException catch (e) {
      debugPrint('Firebase Error: $e');
    }
  }
}
