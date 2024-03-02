import 'package:e_commmerce1/Models/UserModel.dart';

class appSingleton {
  static final _appSingleton = new appSingleton._internal();

  UserModel userDataFromSingleton =
      UserModel(userName: '', userEmail: '', userPassword: '', userPhoneNo: '');

  // static UserModel userDataFromSingleton;
  factory appSingleton() {
    return _appSingleton;
  }

  appSingleton._internal();
}

final appSingletonInstance = appSingleton();
