// Harsha - 28-02-24 - Made UserModel.dart To store user data
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  final String userName;
  final String userEmail;
  final String userPassword;
  final String userPhoneNo;

  UserModel({
    this.id = '',
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.userPhoneNo,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': userName,
        'userEmail': userEmail,
        'userPassword': userPassword,
        'userPhoneNo': userPhoneNo,
      };

  static UserModel fromJson(Map<String, dynamic> jsonData) => UserModel(
      id: jsonData['id'],
      userName: jsonData['userName'],
      userEmail: jsonData['userEmail'],
      userPassword: jsonData['userPassword'],
      userPhoneNo: jsonData['userPhoneNo']);

  static UserModel fromJsonforDynameic(Map<dynamic, dynamic> jsonData) =>
      UserModel(
          id: jsonData['id'],
          userName: jsonData['userName'],
          userEmail: jsonData['userEmail'],
          userPassword: jsonData['userPassword'],
          userPhoneNo: jsonData['userPhoneNo']);

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> jsonData) {
    final data = jsonData.data()!;
    return UserModel(
        id: data['id'],
        userName: data['userName'],
        userEmail: data['userEmail'],
        userPassword: data['userPassword'],
        userPhoneNo: data['userPhoneNo']);
  }

  //Get Single User Data from its email.
  static Future<UserModel> getSingledata(String email) async {
    var isDataPresent = false;
    final userTableObject = await FirebaseFirestore.instance
        .collection('User')
        .where("userEmail", isEqualTo: email)
        .get();

    if (userTableObject.docs.length > 0) {
      var userData =
          userTableObject.docs.map((e) => UserModel.fromSnapshot(e)).single;
      print(userData.userEmail);
      print(userData.userName);
      print(userData.userPassword);
      print(userData.userPhoneNo);
      print(userData.id);
      return userData;
    } else {
      return UserModel(
          userName: '', userEmail: '', userPassword: '', userPhoneNo: '');
    }
  }

  static Future<void> updateUserRecord(UserModel editedUserData) async {
    final userTableObject = await FirebaseFirestore.instance
        .collection('User')
        .doc(editedUserData.id)
        .update(editedUserData.toJson());
  }
}
