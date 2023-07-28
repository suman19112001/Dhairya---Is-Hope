import 'package:animate_do/animate_do.dart';
import 'package:dhairya/common/snackbar.dart';
import 'package:dhairya/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../common/custom_text.dart';
import '../../../utils/app_color.dart';
import '../widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // AuthServices _authServices = AuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _registerKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  void matchPassword() {
    if (_passwordController.text != _confirmPasswordController.text) {
      {
        showSnackBar(context, "Confirm password doesn't match!");
      }
    }
  }

  // void signUpUser() {
  //   _authServices.signUp(
  //     // context: context,
  //     _emailController.text,
  //     _confirmPasswordController.text,
  //   );
  // }

  // void signIn(email, password) async {
  //   try {
  //     Response res = await post(
  //         Uri.parse('http://172.25.179.184:3000/api/signup'),
  //         body: {"name": "Default User", "email": email, "password": password});

  //     if (res.statusCode == 200) {
  //       print('account fetched');
  //     } else {
  //       print(res.statusCode);
  //       print(res.body);
  //       print('Failed');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  void signUp() {
    Provider.of<AuthServies>(context, listen: false).signUpEmail(
        email: _emailController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthServies>(context, listen: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Form(
              key: _registerKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 0.1.sh,
                  ),
                  FadeInUp(
                    child: Center(
                      child: Container(
                        height: 125,
                        width: 125,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  FadeIn(
                    duration: const Duration(seconds: 3),
                    child: Column(
                      children: [
                        const Text(
                          "Registration",
                          style: TextStyle(
                              fontSize: 22,
                              letterSpacing: 1,
                              color: AppColors.textColor1,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30.h),
                        customTextField(
                          controller: _emailController,
                          prefixIcon: const Icon(
                            Icons.person,
                            color: AppColors.grey,
                          ),
                          hintText: "Email ID",
                          context: context,
                        ),
                        SizedBox(height: 10.h),
                        customTextField(
                          controller: _passwordController,
                          obscureText: true,
                          prefixIcon: const Icon(
                            Icons.key,
                            color: AppColors.grey,
                          ),
                          suffixIcon: const Icon(
                            Icons.visibility_off,
                            color: AppColors.grey,
                          ),
                          hintText: "Password",
                          context: context,
                        ),
                        SizedBox(height: 10.h),
                        customTextField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          prefixIcon: const Icon(
                            Icons.key,
                            color: AppColors.grey,
                          ),
                          suffixIcon: const Icon(
                            Icons.visibility_off,
                            color: AppColors.grey,
                          ),
                          hintText: "Confirm password",
                          context: context,
                        ),
                        SizedBox(height: 15.h),
                        SizedBox(
                          height: 40.h,
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: signUp,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.green,
                            ),
                            child: provider.loading
                                ? const CircularProgressIndicator(
                                    color: AppColors.snowWhite,
                                  )
                                : customText("Create account",
                                    color: AppColors.snowWhite,
                                    size: 18,
                                    isBold: true),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Have an account?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5),
                            ),
                            const SizedBox(width: 10),
                            customText("Log In",
                                color: AppColors.green, isBold: true)
                          ],
                        ),
                        SizedBox(height: 0.1.sh),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                              text: "By signing up, you agree to the ",
                              style: TextStyle(
                                letterSpacing: 1,
                                height: 1.5,
                                color: AppColors.textColor,
                                fontWeight: FontWeight.normal,
                              ),
                              children: [
                                TextSpan(
                                  text: "Terms and Conditions ",
                                  style: TextStyle(
                                    color: AppColors.green,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(text: "and "),
                                TextSpan(
                                  text: "Privacy Policy.",
                                  style: TextStyle(
                                    color: AppColors.green,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
