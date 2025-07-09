import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hint, required this.icon,  this.obscureText=false, this.onTap, required this.controller,  this.keyboardType, this.validator});
final String hint;
final IconData icon;
final bool obscureText ;
final  void Function()? onTap;
final TextEditingController controller;
final TextInputType ?keyboardType;
final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return 
    TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType:keyboardType ,
      decoration: InputDecoration(
        hintText: hint,
        
        
        errorBorder:outlineTextFieldBorder() ,
        border: outlineTextFieldBorder(),
        
        suffixIcon: IconButton(onPressed: onTap,icon: Icon( icon,color: AppColors.black.withOpacity(.3)),),
        hintStyle: AppStyle.text16.copyWith(color: AppColors.black.withOpacity(.2)),
      enabledBorder: outlineTextFieldBorder(),
focusedBorder: outlineTextFieldBorder()

      ),
    );
  }
    OutlineInputBorder outlineTextFieldBorder() => OutlineInputBorder(borderSide: BorderSide(color: AppColors.teracotta.withOpacity(.7)),borderRadius: BorderRadius.circular(16));

}