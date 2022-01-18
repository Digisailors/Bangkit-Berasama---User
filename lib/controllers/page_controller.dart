import 'package:bangkit/services/firebase.dart';
import 'package:get/get.dart';

class IndexController extends GetxController {
  static IndexController instance = Get.find();
  int pageNumber = 0;
  void Function(int)? load;
}

class DamLinkController extends GetxController {
  static DamLinkController instance = Get.find();
  Map<String, dynamic>? links = {};

  loadlinks() async {
    links = await damLinks.get().then((value) => value.data());
  }

  @override
  void refresh() {
    // TODO: implement refresh
    super.refresh();
    loadlinks();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadlinks();
  }
}
