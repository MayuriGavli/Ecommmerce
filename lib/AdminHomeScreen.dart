import 'package:e_commmerce1/AdminOrderScreen.dart';
import 'package:e_commmerce1/ManageScreen.dart';
import 'package:e_commmerce1/Models/OrderModel.dart';
import 'package:e_commmerce1/Models/ProductDetailsModel.dart';
import 'package:e_commmerce1/Models/UserModel.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import 'Providers/SharedPreferencesService.dart';

// import '../db/category.dart';
// import '../db/brand.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  MaterialColor active = Colors.blue;
  MaterialColor notActive = Colors.grey;
  var AllUser = '0';

  var AllProduct = '0';

  var AllOrder = '0';

  bool dataFetched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0.1,
          title: const Text("ADMIN PANEL"),
          centerTitle: true,
          actions: const <Widget>[
            Padding(
                padding:
                    EdgeInsets.only(right: 20, left: 8, top: 8, bottom: 8)),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  accountName: const Text("Mayuri Gavli"),
                  accountEmail: const Text("mayuri28@gmail.com"),
                  currentAccountPicture: GestureDetector(
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person),
                    ),
                  )),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageScreen()),
                  );
                },
                child: const ListTile(
                  title: Text("Manage"),
                  leading: Icon(Icons.account_box, color: Colors.blue),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminOrderScreen()),
                  );
                },
                child: const ListTile(
                  title: Text("Orders"),
                  leading: Icon(Icons.shopping_bag, color: Colors.blue),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  // FirebaseAuth.instance.signOut();
                  sharedPrefrenceInstance.saveValue(
                      'userData', ''); //Logout Code
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: const ListTile(
                  title: Text("LogOut"),
                  leading: Icon(Icons.logout, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        body: _load());
  }

  void getAllData() async {
    if (!dataFetched) {
      var AllProductData = await ProductDetailsModel.getAllProductDetail();
      var AllOrdersData = await OrderModel.getAllOrderDetailOfUser();
      var AllUserData = await UserModel.getALlUsers();
      setState(() {
        AllUser = AllUserData.length.toString();
        AllProduct = AllProductData.length.toString();
        AllOrder = AllOrdersData.length.toString();
        dataFetched = true;
      });
    }
  }

  Widget _load() {
    getAllData();
    return Column(
      children: <Widget>[
        ListTile(
          subtitle: TextButton.icon(
            onPressed: null,
            icon: const Icon(
              Icons.currency_rupee,
              size: 30.0,
              color: Colors.green,
            ),
            label: const Text('12,000',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, color: Colors.green)),
          ),
          title: const Text(
            'Revenue',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24.0, color: Colors.black),
          ),
        ),
        Expanded(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile(
                      title: TextButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.person_2_rounded),
                          label: Text("Users",
                              style: TextStyle(color: Colors.black))),
                      subtitle: Text(
                        AllUser,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue, fontSize: 60.0),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile(
                      title: TextButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.category_rounded),
                          label: Text("Category",
                              style: TextStyle(color: Colors.black))),
                      subtitle: const Text(
                        '9',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue, fontSize: 60.0),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile(
                      title: TextButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.track_changes),
                          label: Text("Product",
                              style: TextStyle(color: Colors.black))),
                      subtitle: Text(
                        AllProduct,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue, fontSize: 60.0),
                      )),
                ),
              ),
              /*Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile(
                      title: TextButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.tag_faces),
                          label: Text("Sold",
                              style: TextStyle(color: Colors.black))),
                      subtitle: const Text(
                        '13',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue, fontSize: 60.0),
                      )),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile(
                      title: TextButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.shopping_cart),
                          label: Text("Orders",
                              style: TextStyle(color: Colors.black))),
                      subtitle: Text(
                        AllOrder,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue, fontSize: 60.0),
                      )),
                ),
              ),
              /*Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile(
                      title: TextButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.close),
                          label: Text("Return",
                              style: TextStyle(color: Colors.black))),
                      subtitle: const Text(
                        '0',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue, fontSize: 60.0),
                      )),
                ),
              ),*/
            ],
          ),
        ),
      ],
    );
  }
}