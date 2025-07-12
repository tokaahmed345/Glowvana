import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowvana/core/utils/assets/app_assets.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/app_screens/app_screens.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';
import 'package:glowvana/core/utils/validators/validators.dart';
import 'package:glowvana/core/utils/widgets/custom_elevated_button.dart';
import 'package:glowvana/feature/Auth/presentation/view/widgets/custom_awesom_dialoge.dart';
import 'package:glowvana/feature/Auth/presentation/view/widgets/custom_text_field.dart';
import 'package:glowvana/feature/Auth/presentation/view_model/auth_cubits/login_cubit/log_in_cubit.dart';
import 'package:go_router/go_router.dart';

class LogInBodyView extends StatefulWidget {
  const LogInBodyView({super.key});
  @override
  State<LogInBodyView> createState() => _LogInBodyViewState();
}

class _LogInBodyViewState extends State<LogInBodyView> {
  bool isVisibilty = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, LogInState>(
      listener: (context, state) {
        if (state is LogInSuccess) {
          GoRouter.of(context).push(AppScreens.home);
        } else if (state is LogInFailure) {
          CustomAwesomDialoge.show(
            context: context,
            title: 'Login Failed',
            description: state.errorMessage,
            dialogType: DialogType.error,
            btnOkColor: AppColors.teracotta,
          );
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              AppAssets.logInBackground,
              fit: BoxFit.cover,
            )),
            Positioned.fill(
                child: Padding(
              padding: const EdgeInsets.only(
                  top: 60.0, right: 20, left: 20, bottom: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      "LOGIN",
                      style: AppStyle.text24
                          .copyWith(color: AppColors.teracotta, fontSize: 50),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextFormField(
                      validator: (value) => Validators.validateEmail(value!),
                      controller: emailController,
                      hint: 'Enter your Email',
                      icon: Icons.mail,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextFormField(
                      validator: (value) => Validators.validatePassword(value!),
                      keyboardType: TextInputType.number,
                      controller: passwordController,
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
                          GoRouter.of(context).push(AppScreens.signUp);
                        },
                        child: Text(
                          "Don't have an account ?SignUp",
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
                      text: "LogIn",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<LogInCubit>().logIn(
                              emailController.text, passwordController.text);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            )),
            if (state is LogInLoading)
              Positioned.fill(
                  child: Container(
                decoration:
                    BoxDecoration(color: AppColors.black.withOpacity(.2)),
                child: const Center(child: CircularProgressIndicator()),
              )),
          ],
        );
      },
    );
  }
}
