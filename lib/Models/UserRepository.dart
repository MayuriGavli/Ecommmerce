import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final db = FirebaseFirestore.instance;
//
// createUser(UserModel user)async{
//   await db.collection("User").add(user);
// }
//
//
}
