import 'dart:convert';

import 'package:e_commmerce1/LoginScreen.dart';
import 'package:e_commmerce1/Models/UserModel.dart';
import 'package:e_commmerce1/Navigation.dart';
import 'package:e_commmerce1/Singleton/AppSingleton.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Widget Screen; //Varibale for navigation
  SharedPreferences pref =
      await SharedPreferences.getInstance(); //SharedPrefrence Object
  var data =
      pref.getString('userData'); //getting the data from shared prefrence

  if (data == '') {
    // if empty then navigate to login screen
    print("String Empty");
    Screen = LoginScreen();
  } else {
    Map json = jsonDecode(data ?? ''); //decoding data
    appSingletonInstance.userDataFromSingleton =
        UserModel.fromJsonforDynameic(json); //converting

    print("---------------------------");
    print(appSingletonInstance.userDataFromSingleton.userName);
    print("---------------------------");

    if (appSingletonInstance.userDataFromSingleton.userEmail.isNotEmpty &&
        appSingletonInstance.userDataFromSingleton.userEmail ==
            'mrgavli28@gmail.com') {
      //Navigate to Admin Portel
      // Screen = Admin();
      Screen = Navigation();
    } else if (appSingletonInstance
        .userDataFromSingleton.userEmail.isNotEmpty) {
      //navigate inside the App
      Screen = Navigation();
    } else {
      //Navigate to Login Screen
      Screen = LoginScreen();
    }
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: Screen,
  ));
}

//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MaterialApp(
//     home:
//         //1st method
//     StreamBuilder<User?>( stream:FirebaseAuth.instance.authStateChanges(), builder: (context , snapshots){ if(snapshots.hasData){ return LoginScreen(); }
//     else if(snapshots.hasError){ const Text('No data avaible right now'); } return Center(child: CircularProgressIndicator()); }, ),
//     //2nd method
//     // StreamBuilder<User?>(
//     //   stream: FirebaseAuth.instance.authStateChanges(),
//     //   builder: (BuildContext context, AsyncSnapshot snapshot) {
//     //       if(snapshot.hasError){
//     //           return Text(snapshot.error.toString());
//     //       }
//     //       if(snapshot.connectionState==ConnectionState.active){
//     //         if(snapshot.data==null){
//     //           return const LoginScreen();
//     //         }
//     //         else{
//     //           return HomePage(title:FirebaseAuth.instance.currentUser!.displayName!);
//     //         }
//     //       }
//     //       return const Center(child: CircularProgressIndicator());
//     //     },
//     //
//     // ),
//   ));
// }
