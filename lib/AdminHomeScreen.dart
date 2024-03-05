import 'package:e_commmerce1/AdminOrderScreen.dart';
import 'package:e_commmerce1/EditProductScreen.dart';
import 'package:e_commmerce1/ManageScreen.dart';
import 'package:e_commmerce1/Models/ProductDetailsModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';

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
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.blue;
  MaterialColor notActive = Colors.grey;
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  GlobalKey<FormState> _categoryFormKey = GlobalKey();
  GlobalKey<FormState> _brandFormKey = GlobalKey();
  var AllProductData = ProductDetailsModel.getAllProductDetail();

  // BrandService _brandService = BrandService();
  // CategoryService _categoryService = CategoryService();

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
                  FirebaseAuth.instance.signOut();
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

  Widget _load() {
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
                      subtitle: const Text(
                        '7',
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
                        '23',
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
                      subtitle: const Text(
                        '120',
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
                          icon: Icon(Icons.tag_faces),
                          label: Text("Sold",
                              style: TextStyle(color: Colors.black))),
                      subtitle: const Text(
                        '13',
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
                          icon: Icon(Icons.shopping_cart),
                          label: Text("Orders",
                              style: TextStyle(color: Colors.black))),
                      subtitle: const Text(
                        '5',
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
                          icon: Icon(Icons.close),
                          label: Text("Return",
                              style: TextStyle(color: Colors.black))),
                      subtitle: const Text(
                        '0',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue, fontSize: 60.0),
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// void _categoryAlert() {
//   var alert = new AlertDialog(
//     content: Form(
//       key: _categoryFormKey,
//       child: TextFormField(
//         controller: categoryController,
//         validator: (value){
//           if(value.isEmpty){
//             return 'category cannot be empty';
//           }
//         },
//         decoration: InputDecoration(
//             hintText: "add category"
//         ),
//       ),
//     ),
//     actions: <Widget>[
//       FlatButton(onPressed: (){
//         if(categoryController.text != null){
//           _categoryService.createCategory(categoryController.text);
//         }
//         Fluttertoast.showToast(msg: 'category created');
//         Navigator.pop(context);
//       }, child: Text('ADD')),
//       FlatButton(onPressed: (){
//         Navigator.pop(context);
//       }, child: Text('CANCEL')),
//
//     ],
//   );
//
//   showDialog(context: context, builder: (_) => alert);
// }

// void _brandAlert() {
//   var alert = new AlertDialog(
//     content: Form(
//       key: _brandFormKey,
//       child: TextFormField(
//         controller: brandController,
//         validator: (value){
//           if(value.isEmpty){
//             return 'category cannot be empty';
//           }
//         },
//         decoration: InputDecoration(
//             hintText: "add brand"
//         ),
//       ),
//     ),
//     actions: <Widget>[
//       FlatButton(onPressed: (){
//         if(brandController.text != null){
//           _brandService.createBrand(brandController.text);
//         }
//         Fluttertoast.showToast(msg: 'brand added');
//         Navigator.pop(context);
//       }, child: Text('ADD')),
//       FlatButton(onPressed: (){
//         Navigator.pop(context);
//       }, child: Text('CANCEL')),
//
//     ],
//   );
//
//   showDialog(context: context, builder: (_) => alert);
// }

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical(this.index, {super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    var items = [
      {
        'name': 'T-Shirt',
        'company_name': 'Amazon',
        'is_company_verified': true,
        'price': "\$300.00",
        'image': 'images/products/top.png',
        'discount': '30%',
        'isFavorite': true,
      },
      {
        'name': 'White Lehnaga',
        'company_name': 'Flipcart',
        'is_company_verified': false,
        'price': "\$500.00",
        'image': 'images/products/LEHNAGA.png',
        'discount': '10%',
        'isFavorite': true,
      },
      {
        'name': 'White Shirt',
        'company_name': 'Meesho',
        'is_company_verified': false,
        'price': "\$500.00",
        'image': 'images/products/longskirt.png',
        'discount': '50%',
        'isFavorite': true,
      },
      {
        'name': 'Sadi',
        'company_name': 'Amazon',
        'is_company_verified': false,
        'price': "\$500.00",
        'image': 'images/products/sadi.png',
        'discount': '30%',
        'isFavorite': true,
      },
      {
        'name': 'JumpSuit',
        'company_name': 'Meesho',
        'is_company_verified': false,
        'price': "\$500.00",
        'image': 'images/products/jumsuit.png',
        'discount': '10%',
        'isFavorite': true,
      },
      {
        'name': 'Anarkali',
        'company_name': 'Flipcart',
        'is_company_verified': false,
        'price': "\$500.00",
        'image': 'images/products/anarkali.png',
        'discount': '20%',
        'isFavorite': true,
      },
      {
        'name': 'Gowns',
        'company_name': 'Amazon',
        'is_company_verified': true,
        'price': "\$800.00",
        'image': 'images/products/sadi.png',
        'discount': '50%',
        'isFavorite': true,
      },
      {
        'name': 'Sundress',
        'company_name': 'Amazon',
        'is_company_verified': true,
        'price': "\$500.00",
        'image': 'images/products/top.png',
        'discount': '70%',
        'isFavorite': true,
      },
    ];
    return GestureDetector(
      onTap: () {},
      child: Container(
        // width: 50,
        // height: 50,
        // padding: const EdgeInsets.only(left: 5, right: 1),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(12),
          // boxShadow: [BoxShadow(color: Colors.tealAccent, blurRadius: 50, spreadRadius: 7, offset: Offset(0,2))],
        ),
        child: Column(
          children: [
            Troundedcontainer(
              height: 160,
              width: 900,
              // padding: const EdgeInsets.only(left: 20,top: 7),
              backgroundColor: Colors.transparent,
              // thumbnail image
              child: Stack(
                children: [
                  Troundedimage(
                    imageUrl: items[index]['image'].toString(),
                    applyImageRadius: true,
                    padding: EdgeInsets.only(top: 10, left: 20),
                  ),

                  //sale tag
                  Positioned(
                    top: 5,
                    left: 5,
                    child: Troundedcontainer(
                      radius: 12.0,
                      backgroundColor: Colors.amber,
                      // padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                      child: Text(items[index]['discount'].toString()),
                    ),
                  ),

                  //favorite icon
                  Positioned(
                      top: -8,
                      right: -7,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            // color: dark?
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete),
                          ))),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items[index]['name'].toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontFamily: 'RobotoMono',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        items[index]['company_name'].toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontFamily: 'RobotoMono',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black),
                      ),
                      SizedBox(width: 4),
                      const Icon(
                        Iconsax.verify5,
                        color: Colors.blue,
                        size: 16,
                      )
                    ],
                  ),
                  // SizedBox(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        items[index]['price'].toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontFamily: 'RobotoMono',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            )),
                        child: SizedBox(
                          width: 30 * 1.2,
                          height: 30 * 1.2,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProductScreen()),
                              );
                            },
                            icon: Icon(Iconsax.edit),
                            // child: Center(
                            //     child: Icon(
                            //       Iconsax.edit,
                            //       color: Colors.white,
                            //     )
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Troundedcontainer extends StatelessWidget {
  const Troundedcontainer(
      {super.key,
      this.child,
      this.width,
      this.height,
      this.margin,
      this.padding,
      this.showBorder = false,
      this.radius = 16.0,
      this.backgroundColor = Colors.white30,
      this.borderColor = Colors.amber});

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}

class Troundedimage extends StatelessWidget {
  const Troundedimage(
      {super.key,
      this.border,
      this.width,
      this.height,
      required this.imageUrl,
      this.applyImageRadius = true,
      this.backgroundColor = Colors.transparent,
      this.fit = BoxFit.contain,
      this.padding,
      this.isNetworkImage = false,
      this.borderRadius = 20.0});

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;

  // final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPressed,
      child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
              border: border,
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius)),
          child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Image(
                fit: fit,
                image: isNetworkImage
                    ? NetworkImage(imageUrl)
                    : AssetImage(imageUrl) as ImageProvider),
          )),
    );
  }
}

class FlatButton {}

