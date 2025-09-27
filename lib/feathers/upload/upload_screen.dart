import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/appimages.dart';
import 'package:taskati/core/functions/dialogs.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/AppColor.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/feathers/home/pages/home_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String path = '';
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (path.isNotEmpty && nameController.text.isNotEmpty) {
                LocalHelper.putUserData(nameController.text, path);
                pushTo(context, HomeScreen());
              } else if (path.isNotEmpty && nameController.text.isEmpty) {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: const Text('Warning'),
                    content: const Text('Please enter your name'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                });
              } else if (path.isEmpty && nameController.text.isNotEmpty) {
                ShowErrorDialog(context, 'Please upload an image');
              }
            },
            child: const Text('Done'),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: AppColor.primaryColor,
                  backgroundImage: path.isNotEmpty
                      ? FileImage(File(path))
                      : AssetImage(AppImages.emptyUser),
                ),
                Gap(20),
                MainButton(
                  text: 'Upload For Camera',
                  onPressed: () async {
                    await uploadImage(isCamera: true);
                  },
                  width: 300,
                ),
                Gap(15),
                MainButton(
                  text: 'Upload From Gallery',
                  onPressed: () async {
                    await uploadImage(isCamera: false);
                  },
                  width: 300,
                ),
                Gap(20),
                Divider(),
                Gap(20),
                CustomTextField(
                  hint: 'Enter your name',
                  controller: nameController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> uploadImage({required bool isCamera}) async {
    XFile? file = await ImagePicker().pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (file != null) {
      setState(() {
        path = file.path;
      });
    }
  }
}
