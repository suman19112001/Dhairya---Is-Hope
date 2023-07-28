import 'package:animate_do/animate_do.dart';
import 'package:dhairya/common/custom_text.dart';
import 'package:dhairya/services/auth_services.dart';
import 'package:dhairya/views/auth/screens/register_screen.dart';
import 'package:dhairya/views/auth/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() {
    Provider.of<AuthServies>(context, listen: false).loginWithEmail(
      email: _emailController.text,
      password: _passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthServies>(context, listen: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              children: [
                SizedBox(
                  height: 0.15.sh,
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
                        "Welcome Back!",
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
                      SizedBox(height: 15.h),
                      const Text(
                        "Forget Password?",
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                      SizedBox(height: 15.h),
                      SizedBox(
                        height: 40.h,
                        width: double.maxFinite,
                        child: ElevatedButton(
                          onPressed: loginUser,
                          // onPressed: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => const MainScreen()));
                          // },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.green,
                          ),
                          child: provider.loading
                              ? const CircularProgressIndicator(
                                  color: AppColors.snowWhite,
                                )
                              : customText("Log In",
                                  color: AppColors.snowWhite,
                                  size: 18,
                                  isBold: true),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Not a member?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen()));
                            },
                            child: customText(
                              "Register Now",
                              color: AppColors.green,
                              isBold: true,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
