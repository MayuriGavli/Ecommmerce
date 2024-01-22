import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(
                top: 56.0, left: 20.0, bottom: 24.0, right: 24.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                        height: 120,
                        width: 150,
                        image: AssetImage("images/logo/logo_1.png")),
                    Text(
                      " Welcome,",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 8.0),
                    Text("Always deliver more than expected.",
                        style: Theme.of(context).textTheme.bodyLarge)
                  ],
                ),
                const SizedBox(height: 20.0),
                Form(
                    child: Column(
                  children: [
                    //email
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: "email"),
                    ),
                    const SizedBox(height: 16.0),
                    //passoword
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        labelText: "Password",
                        suffixIcon: Icon(Iconsax.eye_slash),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    //remember
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            const Text("Remember Me")
                          ],
                        ),

                        //Forget Password
                        TextButton(
                            onPressed: () {}, child: Text("forget password")),
                      ],
                    ),

                    const SizedBox(height: 16.0),

                    //sign in button
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("Sign In"))),
                    SizedBox(height: 16.0),

                    //create new account
                    SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () {},
                            child: Text("Create New Account"))),
                    SizedBox(height: 16.0),
                  ],
                ))
              ],
            )),
      ),
    );
  }
}
