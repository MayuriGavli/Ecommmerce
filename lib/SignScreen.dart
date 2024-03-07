import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commmerce1/LoginScreen.dart';
import 'package:e_commmerce1/Models/UserModel.dart';
import 'package:e_commmerce1/Navigation.dart';
import 'package:flutter/material.dart';

// import 'Providers/SharedPreferencesService.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // final FirebaseAuthService _auth = FirebaseAuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _agreedToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 56.0, left: 20.0, bottom: 24.0, right: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Text("Let's Create New Account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                  ],
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

                    //I agree to Privacy Policy and Terms of use
                    Row(
                      children: [
                        Checkbox(
                          value: _agreedToTerms,
                          onChanged: (value) {
                            setState(() {
                              _agreedToTerms = value!;
                            });
                          },
                        ),
                        const Text("I agree to Privacy Policy and Terms of use")
                      ],
                    ),

                    const SizedBox(height: 16.0),

                    //create new account
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          // Check if the form is valid and terms are agreed
                          if (_formKey.currentState!.validate() &&
                              _agreedToTerms) {
                            // Map<String,dynamic> employeeInfoMap={
                            //    "id": id,
                            //   "UserName":_nameController.text,
                            //   "Useremail":_emailController.text,
                            //   "UserPassword":_passwordController.text,
                            //   "UserPhone":_phoneController.text,
                            // };
                            // await DatabaseMethods().addUserdetails(employeeInfoMap, id);
                            _signUp();
                          }
                        },
                        child: const Text("Create New Account"),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          // Navigate to the SignupScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text("Already Create Account"),
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

  void _signUp() async {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String phoneNo = _phoneController.text;

    //new Code of HR
    // Harsha - 28-02-24 - Inserted the data into firebase table named as 'User'
    // final docUser = FirebaseFirestore.instance.collection('User').doc(); //get the user table and made object
    final userTableObject = FirebaseFirestore.instance
        .collection('User')
        .doc(); //get the user table and made object
    final userData = UserModel(
        id: userTableObject.id,
        userName: name,
        userEmail: email,
        userPassword: password,
        userPhoneNo: phoneNo); //making an object of user data
    final jsonData = userData.toJson(); // Converted the userdata into json
    await userTableObject.set(jsonData).then((obj) {
      //checking if the data is inserted oor not
      print("data inserted succesfully");
      print("=================");
      print(userTableObject.id);
      print("=================");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Navigation()),
      );
    }).catchError((onError) {
      print(onError);
    });

    /* //Old code of MR

    User? user = await _auth.signupWithEmailAndPassword(email, password);
    if (user != null) {
      print("User is Successfully Created");
      // await SharedPreferencesService.saveValue('user_email', user);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Navigation()),
      );
    } else {
      print("Some Error Happened");
    }
     */
  }
}

