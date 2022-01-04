import 'package:bangkit/services/firebase.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  var auth = Auth();
}
