import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:spotifyyapp/ApiEndpoints/ApiEndpoints.dart';
import 'package:spotifyyapp/Core/ColorsManager.dart';
import 'package:spotifyyapp/Core/RoutesManager.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfirmPassController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  Future<void> RegisterWithEmail() async {
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        ConfirmPassController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty) {
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

    if (passwordController.text.trim() != ConfirmPassController.text.trim()) {
      Get.snackbar(
        "Error",
        "Passwords do not match",
        backgroundColor: ColorsManager.red,
        colorText: ColorsManager.white,
      );
      return;
    }

    isLoading.value = true;

    Uri uri = Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.auth.register);

    try {
      Map<String, dynamic> body = {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'confirmPassword': ConfirmPassController.text.trim(),
        'phone': phoneController.text.trim(),
        'avaterId': 1,
      };
      http.Response response = await http.post(uri, headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Success", "Sign Up Successful ❤️",
          backgroundColor: ColorsManager.green,
          colorText: ColorsManager.white,
        );
        Get.offAllNamed(RoutesManager.loginScreen);
      } else {
        Get.snackbar("Error", "Failed: ${response.statusCode}\n${response.body}",
          backgroundColor: ColorsManager.red,
          colorText: ColorsManager.white,
        );
      }
    } catch (error) {
      Get.snackbar("Exception", error.toString(),
        backgroundColor: ColorsManager.red,
        colorText: ColorsManager.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    ConfirmPassController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
