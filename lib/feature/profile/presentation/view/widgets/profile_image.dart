import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/helpers/user_setting_storage/hive_helper.dart';

class ProfileImageWidget extends StatefulWidget {
  const ProfileImageWidget({super.key});

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  final picker = ImagePicker();
  final userSettings = UserSettingsStorage();

  String? imagePath;

  @override
  void initState() {
    super.initState();
    imagePath = userSettings.getImageSaved();
  }

  Future<void> _pickImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      await userSettings.saveSelectedImage(picked.path);
      setState(() {
        imagePath = picked.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: 60,
        backgroundImage: imagePath != null
            ? FileImage(File(imagePath!))
            : const AssetImage("assets/images/default_user.png")
                as ImageProvider,
        backgroundColor: AppColors.salmon,
      ),
    );
  }
}
