import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/app_screens/app_screens.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';
import 'package:glowvana/core/utils/validators/validators.dart';
import 'package:glowvana/core/utils/widgets/custom_elevated_button.dart';
import 'package:glowvana/feature/Auth/presentation/view/widgets/custom_dialog.dart';
import 'package:glowvana/feature/Auth/presentation/view/widgets/custom_text_field.dart';
import 'package:glowvana/feature/Auth/presentation/view_model/auth_cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:go_router/go_router.dart';
class SignUpBodyView extends StatefulWidget {
  const SignUpBodyView({super.key});
  @override
  State<SignUpBodyView> createState() => _SignUpBodyViewState();
}
class _SignUpBodyViewState extends State<SignUpBodyView> {
  bool isVisibilty = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          showDialog(
              context: context,
              builder: (context) {
                return CustomDialog(
                    title: 'Success',
                    content: "Your account has been created successfully!",
                    onOkPressed: () {
                      GoRouter.of(context).push(AppScreens.logIn);
                    });
              });
        } else if (state is SignUpFailure) {
          showDialog(
              context: context,
              builder: (context) {
                return CustomDialog(
                  title: 'Registration Failed',
                  content: state.errorMessage,
                  onOkPressed: () => Navigator.pop(context),
                );
              });
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              'assets/images/background.jfif',
              fit: BoxFit.cover,
            )),
            Positioned.fill(
                child: Padding(
              padding: const EdgeInsets.only(
                  top: 50.0, right: 20, left: 20, bottom: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      "Sign_Up",
                      style: AppStyle.text24
                          .copyWith(color: AppColors.teracotta, fontSize: 50),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextFormField(
                      validator: (value) =>
                          Validators.validateUserName(value!),
                      controller: userNameController,
                      hint: 'Enter UserName',
                      icon: Icons.person_2_outlined,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextFormField(
                      validator: (value) =>
                          Validators.validateEmail(value!),
                      controller: emailController,
                      hint: 'Enter your Email',
                      icon: Icons.mail,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextFormField(
                      validator: (value) =>
                          Validators.validatePassword(value!),
                      controller: passwordController,
                      keyboardType: TextInputType.number,
                      onTap: () {
                        setState(() {
                          isVisibilty = !isVisibilty;
                        });
                      },
                      hint: 'Enter your Password',
                      icon:
                          isVisibilty ? Icons.visibility : Icons.visibility_off,
                      obscureText: !isVisibilty,
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          GoRouter.of(context).push(AppScreens.logIn);
                        },
                        child: Text(
                          "Aleardy have an account ?LogIn",
                          style: AppStyle.text24.copyWith(
                            color: AppColors.teracotta.withOpacity(.7),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomElevatedButton(
                        textColor: AppColors.teracotta,
                        color: AppColors.primary,
                        text: "Sign_Up",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<SignUpCubit>().register(
                                emailController.text,
                                passwordController.text,
                                userNameController.text);
                          }
                        }),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            )),
            if (state is SignUpLoading)
              Positioned.fill(
                child: Container(
                  color: AppColors.black.withOpacity(.2),
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ),
          ],
        );
      },
    );
  }
}
