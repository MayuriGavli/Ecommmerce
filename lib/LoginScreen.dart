import 'dart:convert';

import 'package:e_commmerce1/AdminHomeScreen.dart';
import 'package:e_commmerce1/Models/UserModel.dart';
import 'package:e_commmerce1/Navigation.dart';
import 'package:e_commmerce1/Singleton/AppSingleton.dart';
import 'package:e_commmerce1/usr_auth/firebase_auth_implementation/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'Providers/SharedPreferencesService.dart';
import 'Googlelogin.dart';
import 'SignScreen.dart';

// import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  User? _user;

  final FirebaseAuthService _auth = FirebaseAuthService();

  // final SharedPreferencesService _prefs = SharedPreferencesService();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();

    // if (appSingletonInstance.userName.isNotEmpty){
    //   print("---------------------------");
    //   print(appSingletonInstance.userName);
    //   print("---------------------------");
    //
    //   Navigator.of(context).pushNamed(Navigation() as String);
    //
    //   // setState(() {});
    //     // Navigator.push(
    //     //   context,
    //     //   MaterialPageRoute(builder: (context) => Navigation()),
    //     // );
    //   }
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //Main Code
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 56.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    height: 120,
                    width: 230,
                    image: AssetImage("images/logo/logo_1.png"),
                  ),
                  Text(
                    "          Welcome,",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "Always deliver more than expected.",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              buildLoginForm(),
            ],
          ),
        ),
      ),
    );
  }

  //Login Form Design Code
  Widget buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                labelText: "E-mail"),
            keyboardType: TextInputType.emailAddress,
            validator: (email) {
              if (email!.isEmpty) {
                return 'Enter Valid Email';
              } else if (!RegExp(
                  r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                  .hasMatch(email)) {
                return 'Enter a valid Email Address';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: "Password",
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
            validator: (password) {
              if (password == null || password.isEmpty) {
                return 'Please enter your password';
              } else if (password.length < 3) {
                return 'Password must be at least 3 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value!;
                      });
                    },
                  ),
                  const Text("Remember Me"),
                ],
              ),
              TextButton(
                onPressed: () {
                  // Implement your Forgot Password functionality here
                  // For example, you can navigate to a new screen or show a dialog.
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                },
                child: Text("Forgot password"),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _signIn();
                }
              },
              child: Text("Sign In"),
            ),
          ),
          SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                // Navigate to the SignupScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: Text("Create New Account"),
            ),
          ),
          SizedBox(height: 30.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: Divider(
                    color: Colors.grey,
                  )),
              Text("Or Sign In With"),
              Flexible(
                  child: Divider(
                    color: Colors.grey,
                  )),
            ],
          ),
          const SizedBox(height: 27.0),
          // _googleSignIn(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                  onPressed: () {
                    // signInWithGoogle();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInDemo()),
                    );
                  },
                  icon: Image(
                      width: 25,
                      height: 25,
                      image: AssetImage("images/logo/ggo.png")),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  //Functions
  //SignUp With Google Function
  // signInWithGoogle() async {
  //
  //   GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //   AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   UserCredential userCredential =
  //   await FirebaseAuth.instance.signInWithCredential(credential);
  //   print(userCredential.user?.displayName);
  // }

  //Login Function
  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    var userData = await UserModel.getSingledata(email);

    if (userData.userEmail == '') {
      // you have to addd validation
      Fluttertoast.showToast(
          msg: "Enter Valid E-mail & Password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      appSingletonInstance.userDataFromSingleton =
          userData; //saving data in Global Variable
      SharedPreferences sharedPreferenceInstance =
          await SharedPreferences.getInstance(); //Shared prefrence object
      String userDataEncodeInJson = jsonEncode(userData); // encoding data
      sharedPreferenceInstance.setString('userData', userDataEncodeInJson);
      //saving data into shared prefrence
      if (userData.userEmail == 'mrgavli28@gmail.com') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Admin()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Navigation()),
        );
      }
    }
  }
}
