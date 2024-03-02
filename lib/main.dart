import 'package:e_commmerce1/BuyNow.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    home: BuyNowScreen(),
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
