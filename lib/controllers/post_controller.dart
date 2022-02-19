import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/models/aid_and_grant.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final Post post;

  PostController(this.post);

  double myRating = 0.0;

  @override
  void onInit() {
    streamMyRating().listen((event) {
      if (event.exists) {
        var rating = Rating.fromJson(event.data()!);
        myRating = rating.stars.toDouble();
        update();
      }
    });
    super.onInit();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamMyRating() {
    return posts.doc(post.id.toString()).collection("ratings").doc(authController.auth.currentUser!.uid).snapshots();
  }
}
