import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  _SignScreenState createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();

  @override
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 30),
                      Text("Let's Create New Account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30))
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Form(
                      child: Column(
                    children: [
                      //username
                      TextFormField(
                        controller: _namecontroller,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.personalcard),
                            border: OutlineInputBorder(),
                            labelText: "Username"),
                        validator: (name) {
                          print('Error');
                          if (name!.isEmpty) {
                            return 'Enter Valid Username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),

                      //E-mail
                      TextFormField(
                        // controller: _namecontroller,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.direct),
                            border: OutlineInputBorder(),
                            labelText: "Phone Number"),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 16.0),

                      //Phone Number
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.call),
                            border: OutlineInputBorder(),
                            labelText: "E-mail"),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16.0),

                      //Password
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: "Password",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Iconsax.eye_slash),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      //remember
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              const Text(
                                  "I agree to Privacy Policy and Terms of use")
                            ],
                          ),

                          //I agree
                          // TextButton(onPressed: (){}, child: Text("I agree to Priacy Policy and Terms of use")),
                        ],
                      ),

                      const SizedBox(height: 16.0),

                      //create new account
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                _formKey.currentState!.validate();
                              },
                              child: const Text("Create New Account"))),
                      const SizedBox(height: 16.0),
                    ],
                  ))
                ],
              ),
            )),
      ),
    );
  }
}
