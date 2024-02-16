import 'package:e_commmerce1/EditProfile.dart';
import 'package:e_commmerce1/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: const Text("Profile"),
        centerTitle: true,
        actions: const <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20, left: 8, top: 8, bottom: 8)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: AssetImage("images/logo/pro.png"),
                          )),
                    ),
                    const SizedBox(height: 10.0),
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet()));
                        },
                        child: Text("Change Profile Picture"))
                  ],
                ),
              ),

              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 16),
              const Text("Profile Information",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 30.0),

              ProfileMenu(onPressed: () {}, title: "User ID", value: "2002"),
              ProfileMenu(
                  onPressed: () {}, title: "UserName", value: "Gavli Mayuri"),
              ProfileMenu(
                  onPressed: () {}, title: "E-mail", value: "mayuri@gmail.com"),
              ProfileMenu(onPressed: () {}, title: "Password", value: "1234"),
              ProfileMenu(
                  onPressed: () {}, title: "Phone Number", value: "1234567890"),
              const SizedBox(height: 16),
              const Divider(),

              const SizedBox(height: 16.0),

              //Edit profile
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    //Check if the form is valid and terms are agreed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  child: const Text("Edit Profile"),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    //log out
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("No")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                      );
                                    },
                                    child: Text("Yes"))
                              ],
                              title: Text("Logging Out"),
                              contentPadding: EdgeInsets.all(20.0),
                              content: Text("Are You Sure?"),
                            ));
                  },
                  child: Text("Log Out"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: <Widget>[
        const Text("Choose Profile Photo", style: TextStyle(fontSize: 20.0)),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Iconsax.camera),
                label: Text("Camera")),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Iconsax.gallery),
                label: Text("Gallery")),
          ],
        )
      ]),
    );
  }
}

class CircularImage extends StatelessWidget {
  const CircularImage(
      {super.key,
      this.width = 56,
      this.height = 56,
      this.overlayColor,
      this.backgroundcolor,
      required this.image,
      this.fit,
      this.padding = 16.0,
      this.isNetworkingImage = false});

  final BoxFit? fit;
  final String image;
  final bool isNetworkingImage;
  final Color? overlayColor;
  final Color? backgroundcolor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkingImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.value});

  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(title,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis)),
            Expanded(
                flex: 3,
                child: Text(value,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis)),
          ],
        ),
      ),
    );
  }
}
