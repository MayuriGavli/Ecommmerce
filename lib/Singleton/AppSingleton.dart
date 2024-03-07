import 'package:e_commmerce1/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Models/ProductDetailsModel.dart';

class appSingleton {
  static final _appSingleton = new appSingleton._internal();

  UserModel userDataFromSingleton =
      UserModel(userName: '', userEmail: '', userPassword: '', userPhoneNo: '');

  ProductDetailsModel productDetailToEdit = ProductDetailsModel(
      id: '',
      ProductName: '',
      CompanyName: '',
      Discount: '',
      ProductPrice: '',
      imageURL: '',
      isLiked: false);

  // static UserModel userDataFromSingleton;
  factory appSingleton() {
    return _appSingleton;
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message.isNotEmpty ? message : "Dummy Message",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  appSingleton._internal();
}

final appSingletonInstance = appSingleton();
