import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Core/ColorsManager.dart';
import '../Core/RoutesManager.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }
  Future<void> registerWithEmail() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPassController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "All fields are required",
        backgroundColor: ColorsManager.red,
        colorText: ColorsManager.white,
      );
      return;
    }

    if (!_isValidEmail(emailController.text.trim())) {
      Get.snackbar(
        "Error",
        "Invalid email format",
        backgroundColor: ColorsManager.red,
        colorText: ColorsManager.white,
      );
      return;
    }

    if (passwordController.text.trim() !=
        confirmPassController.text.trim()) {
      Get.snackbar(
        "Error",
        "Passwords do not match",
        backgroundColor: ColorsManager.red,
        colorText: ColorsManager.white,
      );
      return;
    }

    try {
      isLoading.value = true;

      /// 🔥 Create user
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      await userCredential.user!
          .updateDisplayName(nameController.text.trim());

      Get.snackbar(
        "Success",
        "Account created successfully",
        backgroundColor: ColorsManager.green,
        colorText: ColorsManager.white,
      );

      Get.offAllNamed(RoutesManager.loginScreen);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        e.message ?? "Registration failed",
        backgroundColor: ColorsManager.red,
        colorText: ColorsManager.white,
      );
    } finally {
      isLoading.value = false;
    }
  }


  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
}
