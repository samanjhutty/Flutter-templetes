import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FilePickerResult? pickedfile;
  Uint8List? webImage;
  File? image;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Center(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                      radius: 160,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(160),
                        child: kIsWeb
                            ? webImage != null
                                ? Image.memory(webImage!,
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover)
                                : const Icon(Icons.person, size: 160)
                            : image != null
                                ? Image.file(File(image!.path),
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover)
                                : const Icon(Icons.person, size: 160),
                      )),
                  SizedBox(
                      width: 350,
                      child: Column(children: [
                        Row(children: [
                          Expanded(
                              child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 24)),
                                  onPressed: () => pickImage(),
                                  label: const Text('Pick Image'),
                                  icon: const Icon(Icons.upload_rounded)))
                        ]),
                        const SizedBox(height: 24),
                        Row(children: [
                          Expanded(
                              child: ElevatedButton.icon(
                                  onPressed: () => uploadImage(),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: scheme.primary,
                                      foregroundColor: scheme.onPrimary,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 24)),
                                  label: const Text('Uplaod Image'),
                                  icon: const Icon(Icons.upload_rounded)))
                        ]),
                      ]))
                ])));
  }

  pickImage() async {
    pickedfile = await FilePicker.platform.pickFiles(type: FileType.image);
    if (pickedfile != null) {
      setState(() {
        kIsWeb
            ? webImage = pickedfile!.files.single.bytes
            : image = File(pickedfile!.files.single.path!);
      });
    } else {
      debugPrint('No Image selected');
      mySnackbar('No Image selected');
    }
  }

  uploadImage() async {
    if (image == null && webImage == null) {
      mySnackbar('Select an Image first!');
    } else {
      try {
        storage.FirebaseStorage fbStorage = storage.FirebaseStorage.instance;

        storage.Reference ref = fbStorage.ref().child('image-profilephoto.jpg');

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
