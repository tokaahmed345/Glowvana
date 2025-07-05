import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';

class CustomDialog  extends StatelessWidget{
  const CustomDialog({super.key, required this.title, required this.content, required this.onOkPressed});

 final String title;
  final String content;
  final VoidCallback onOkPressed;

  @override
  Widget build(BuildContext context) {
    
        return AlertDialog(
          backgroundColor: AppColors.primary,
          title:  Text(title,style: AppStyle.text24.copyWith(color:AppColors.teracotta)),
          content: Text(content,style: AppStyle.text16.copyWith(fontSize: 18,color:AppColors.black),),
          actions: [
            TextButton(
            onPressed: onOkPressed,
            child:  Text("OK",style: AppStyle.text16.copyWith(fontSize: 18,color:AppColors.black)),
          ),
          ],
        );
  }
}