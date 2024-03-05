import 'dart:convert';

import 'package:e_commmerce1/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Singleton/AppSingleton.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = appSingletonInstance.userDataFromSingleton.userName;
    _emailController.text =
        appSingletonInstance.userDataFromSingleton.userEmail ?? '';
    _passwordController.text =
        appSingletonInstance.userDataFromSingleton.userPassword ?? '';
    _phoneController.text =
        appSingletonInstance.userDataFromSingleton.userPhoneNo ?? '';
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.1,
        title: const Text("Edit Profile"),
        leading: IconButton(
          onPressed: () {},
          icon: IconButton(
            icon: Icon(Iconsax.arrow_left),
            onPressed: () {
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Navigation()),
              // );
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 40.0, left: 20.0, bottom: 24.0, right: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [],
                ),
                const SizedBox(height: 20.0),
                Column(
                  children: [
                    //username
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          labelText: "Username"),
                      validator: (name) {
                        if (name!.isEmpty) {
                          return 'Enter Valid Username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    //E-mail
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

                    //Phone Number
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                          labelText: "Phone Number"),
                      keyboardType: TextInputType.phone,
                      validator: (phone) {
                        if (phone!.isEmpty) {
                          return 'Enter Valid Phone Number';
                        } else if (!RegExp(r'^[0-9]{10}$').hasMatch(phone)) {
                          return 'Enter a valid 10-digit Phone Number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    //Password
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
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (password) {
                        if (password!.isEmpty) {
                          return 'Enter Valid Password';
                        } else if (password.length < 3) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    //save
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Check if the form is valid and terms are agreed
                          if (_formKey.currentState!.validate()) {
                            _editProfileData();
                          }
                        },
                        child: const Text("Save"),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    //cancel
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          //Navigate back to profile screen
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _editProfileData() async {
    // Perform the form submission logic here
    String name = _nameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;
    String password = _passwordController.text;
    String userId = appSingletonInstance.userDataFromSingleton.id;

    // For demonstration purposes, just print the form data
    print('Name: $userId');
    print('Name: $name');
    print('Email: $email');
    print('Phone: $phone');
    print('Password: $password');

    var editedUserData = UserModel(
        id: userId,
        userName: name,
        userEmail: email,
        userPassword: password,
        userPhoneNo: phone);
    await UserModel.updateUserRecord(editedUserData);

    appSingletonInstance.userDataFromSingleton =
        editedUserData; //saving data in Global Variable
    SharedPreferences sharedPreferenceInstance =
        await SharedPreferences.getInstance(); //Shared preference object
    String userDataEncodeInJson = jsonEncode(editedUserData); // encoding data
    sharedPreferenceInstance.setString('userData', userDataEncodeInJson);

    Fluttertoast.showToast(
        msg: "Profile Update Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);

    Navigator.pop(context); //Navigate back to profile screen
  }
}
