import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http; 
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotifyyapp/ApiEndpoints/ApiEndpoints.dart';
import 'package:spotifyyapp/Core/ColorsManager.dart';
import 'package:spotifyyapp/Core/RoutesManager.dart';


class LoginController  extends GetxController{
    var isLoading=false.obs;
    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    Future<SharedPreferences> _prefs=SharedPreferences.getInstance();
    Future<void>LoginWithEmail()async{
      Uri uri=Uri.parse(ApiEndpoints.baseUrl+ApiEndpoints.auth.login);
      var headers = {'Content-Type': 'application/json'};
      try
      {
        isLoading.value=true;
        Map<String,dynamic> body= {
          'email': emailController.text.trim(),
          'password': passwordController.text.trim()
        };
        http.Response response = await http.post(uri, headers: headers, body: jsonEncode(body),);
        if(response.statusCode==200)
        {
          final json=jsonDecode(response.body);
          Get.snackbar("Success", "Successful LogIn",
          colorText: ColorsManager.whiteGrey,
            backgroundColor: ColorsManager.green,
            snackPosition: SnackPosition.BOTTOM
          );
          Get.offAllNamed(RoutesManager.layoutScreen);
        }else {
          Get.snackbar("Failed","Failed to LogIn",
          colorText: ColorsManager.white,
            backgroundColor: ColorsManager.red,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
      catch(error)
      {
         Get.snackbar("Exception",error.toString());
      }finally{
        isLoading.value=false;
      }
    }
}