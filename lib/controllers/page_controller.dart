import 'package:bangkit/services/firebase.dart';
import 'package:get/get.dart';

class IndexController extends GetxController {
  static IndexController instance = Get.find();
  int homeIndex = 0;
  int bottomIndex = 0;

  void Function(int)? load;

  RxInt get home => instance.homeIndex.obs;
}

class DamLinkController extends GetxController {
  static DamLinkController instance = Get.find();
  Map<String, dynamic>? links = {};

  loadlinks() async {
    links = await damLinks.get().then((value) => value.data());
  }

  @override
  void refresh() {
    // ignore: todo
    // TODO: implement refresh
    super.refresh();
    loadlinks();
  }

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
    loadlinks();
  }
}
