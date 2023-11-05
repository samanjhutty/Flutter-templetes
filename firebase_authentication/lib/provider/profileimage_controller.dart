import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ProfileController with ChangeNotifier {
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

  uploadImage() async {
    if (image == null && webImage == null) {
      mySnackbar('Select an Image first!');
    } else {
      try {
        storage.FirebaseStorage fbStorage = storage.FirebaseStorage.instance;
        storage.Reference ref =
            fbStorage.ref().child('image-profilephoto_${_user!.uid}.jpg');

        if (pickedfile != null) {
          mySnackbar('uploading...');
          kIsWeb
              ? ref.putData(pickedfile!.files.single.bytes!)
              : ref.putFile(File(pickedfile!.files.single.path!));
          mySnackbar('Sucess');
        } else {
          mySnackbar('No Image Selected!');
        }
      } on FirebaseException catch (e) {
        mySnackbar('Firebase error occured!');
        debugPrint('FB Error $e');
      } catch (e) {
        mySnackbar('something unexpected occured!');
        debugPrint('Error $e');
      }
    }
  }

  mySnackbar(String text) async {
    await Get.closeCurrentSnackbar();
    Get.rawSnackbar(message: text);
  }
}
