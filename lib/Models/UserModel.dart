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
      userName: jsonData['userName'],
      userEmail: jsonData['userEmail'],
      userPassword: jsonData['userPassword'],
      userPhoneNo: jsonData['userPhoneNo']);

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> jsonData) {
    final data = jsonData.data()!;
    return UserModel(
        userName: data['userName'],
        userEmail: data['userEmail'],
        userPassword: data['userPassword'],
        userPhoneNo: data['userPhoneNo']);

    // userName: jsonData['userName'],
    // userEmail: jsonData['userEmail'],
    // userPassword: jsonData['userPassword'],
    // userPhoneNo: jsonData['userPhoneNo']);
  }

  // static UserModel getSingleUserData(String email) async {
  //   final userTableObject = FirebaseFirestore.instance.collection('User').where("userEmail",isEqualTo: email).get();
  //   final userData = userTableObject.d
  //
  //   // FirebaseFirestore.instance.collection('User')
  //   //     .snapshots()
  //   //     .map((snapshots) =>
  //   //     snapshots.docs.map((doc) => UserModel.fromJson(doc.data()))
  //   //         .toList());
  // }
  //

  //Get Single User Data from its email.
  static Future<UserModel> getSingledata(String email) async {
    final userTableObject = await FirebaseFirestore.instance
        .collection('User')
        .where("userEmail", isEqualTo: email)
        .get();
    var userData =
        userTableObject.docs.map((e) => UserModel.fromSnapshot(e)).single;
    print(userData.userEmail);
    print(userData.userName);
    print(userData.userPassword);
    print(userData.userPhoneNo);
    print(userData.id);

    if (userData.userEmail.isNotEmpty) {
      return userData;
    } else {
      return UserModel(
          userName: '', userEmail: '', userPassword: '', userPhoneNo: '');
    }
  }
}
