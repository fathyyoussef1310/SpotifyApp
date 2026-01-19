import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:spotifyyapp/Core/ColorsManager.dart';
class ProfileController extends GetxController {
  var isLoading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var name = ''.obs;
  var email = ''.obs;
  Future<void> getProfile() async {
    try {
      isLoading.value = true;
      User? user = _auth.currentUser;
      if (user != null) {
        name.value = user.displayName ?? "No User Name Added";
        email.value = user.email ?? "No Email";
      } else {
        Get.snackbar("Error", "Please try again",
          backgroundColor: ColorsManager.red,
          colorText: ColorsManager.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error", "Error: $e", backgroundColor: ColorsManager.red,
        colorText: ColorsManager.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
