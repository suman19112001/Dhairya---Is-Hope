// ignore_for_file: use_build_context_synchronously

import 'package:dhairya/views/auth/screens/login_screen.dart';
import 'package:dhairya/views/main%20screen/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/snackbar.dart';
import '../utils/app_color.dart';

class AuthServies with ChangeNotifier {
  String uid = "";
  String get getUid => uid;

  String hasError = "";
  String get gotSomeError => hasError;

  String mail = "";
  String get getEmail => mail;

  bool loading = false;
  bool get setLoading => loading;

  bool _isVisible = true;
  bool get isVisible => _isVisible;

  void toogle() {
    _isVisible != _isVisible;
    notifyListeners();
  }

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> signUpEmail({
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      loading = true;
      notifyListeners();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      if (password != confirmPassword) {
        loading = false;
        notifyListeners();
        return showSnackBar(context, "Password doesn't match.");
      } else {
        UserCredential userCredential =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        User? user = userCredential.user;
        uid = user!.uid;
        sharedPreferences.setString('uid', uid);
        showSnackBar(context, 'Account Created Successfully!.',
            color: AppColors.green);
        navigateToAuth(context);

        // QuickAlert.show(
        //   context: context,
        //   type: QuickAlertType.success,
        //   text: 'Account Created Successfully!.',
        //   onConfirmBtnTap: () => navigateToAuth(context),
        // );
        //showSnackBar(context, "Account created Successfully");

        loading = false;
        notifyListeners();
        //await sendEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      debugPrint(e.message);
      loading = false;
      notifyListeners();
      if (e.code == 'unknown' || e.code == 'invalid-email') {
        hasError = e.message!;
        return showSnackBar(context, "Enter a Valid Email!");
      } else if (e.code == 'account-exists-with-different-credential') {
        hasError = e.message!;
        return showSnackBar(context, "${e.message}");
      } else if (e.code == 'email-already-in-use') {
        hasError = e.message!;
        return showSnackBar(context, "Email Already in use. Try Another!");
      } else if (e.code == 'weak-password') {
        hasError = e.message!;
        return showSnackBar(context, "Password too weak!");
      } else {
        hasError = e.message!;
        return showSnackBar(context, "${e.message}");
      }
      // showSnackBar(context, e.message.toString());
    }
  }

  ///////////LOGIN IN//////////////////

  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      loading = true;
      notifyListeners();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      uid = user!.uid;
      mail = user.email.toString();
      sharedPreferences.setString('uid', uid);
      sharedPreferences.setString('getMail', mail);
      navigateToHome(context);
      loading = false;
      notifyListeners();

      // if (!firebaseAuth.currentUser!.emailVerified) {
      //   await sendEmailVerification(context);
      // }
    } on FirebaseAuthException catch (e) {
      loading = false;
      notifyListeners();

      if (e.code == "unknown" || e.code == "invalid-email") {
        hasError = e.message!;
        return showSnackBar(context, "Enter a valid Email!");
      } else if (e.code == "user-not-found") {
        hasError = e.message!;
        return showSnackBar(context, "No User Account Found!");
      } else if (e.code == "wrong-password") {
        hasError = e.message!;
        return showSnackBar(context, "Wrong Password or Email!");
      } else {
        hasError = e.message!;
        return showSnackBar(context, e.message!);
      }
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      await firebaseAuth.signOut();
      sharedPreferences.clear();
      navigateToAuth(context);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  void navigateToHome(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MainScreen()));
  }

  void navigateToAuth(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
