import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../ApiEndpoints/ApiEndpoints.dart';

class Profilecontroller extends GetxController {
  var isLoading = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  Future<void> getProfile() async {
    isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? "";
    if (token.isEmpty) {
      Get.snackbar("Error", "Token not found, please Ensure Your Data again");
      isLoading.value = false;
      return;
    }
    final uri = Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.auth.getProfile,);
    try {
      final response = await http.get(uri,
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        nameController.text = data['user']['name'];
        emailController.text = data['user']['email'];
      } else {
        Get.snackbar("Error", "Failed to fetch profile");
      }
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }
}
