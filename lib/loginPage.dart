import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.0)),
      height: 200.0,
      margin: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
      child: Carousel(
        boxFit: BoxFit.cover,
        images: const [
          AssetImage('images/products/p_1.jpg'),
          AssetImage('images/products/p_2.jpg'),
          AssetImage('images/products/p_3.jpg'),
          AssetImage('images/products/p_1.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: const Duration(milliseconds: 1000),
        indicatorBgPadding: 4.0,
        dotSize: 4.0,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: const Text("Login App"),
        actions: <Widget>[
          const Padding(
              padding: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8)),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: const Text("Mauri Gali"),
                accountEmail: const Text("mayuri@gmail.com"),
                currentAccountPicture: GestureDetector(
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person),
                  ),
                )),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("Home Page"),
                leading: Icon(Icons.home, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("My Account"),
                leading: Icon(Icons.account_box, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("My Orders"),
                leading: Icon(Icons.shopping_bag, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("Favourites"),
                leading: Icon(Icons.favorite, color: Colors.red),
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.account_box, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("About Us"),
                leading: Icon(
                  Icons.help,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          imageCarousel,
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Popular Categories",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16.0),
                  SizedBox(
                      height: 80,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 9,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          var categories = ['Anarkali','   Denim',' Dungree','    Gowns','    Kurti','    Sari','  Shorts','     Skirts','Sundress'];
                          var images = ['images/category/anarkali_crop.png',
                            'images/category/denim-modified.png',
                            'images/category/dungree-modified.png',
                            'images/category/gown1-modified.png',
                            'images/category/kurti-modified.png',
                            'images/category/sari1-modified.png',
                            'images/category/shorts.png',
                            'images/category/skirts-modified.png',
                            'images/category/sundress1-modified.png'];
                          return GestureDetector(
                              child: Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Column(children: [
                                    Container(
                                      width: 56,
                                      height: 56,
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius:
                                          BorderRadius.circular(100)),
                                      child: Image(
                                          image: AssetImage(images[index]),
                                          fit: BoxFit.fill),
                                    ),
                                    const SizedBox(height: 16.0 / 2),
                                    SizedBox(
                                        width: 55,
                                        child: Text(categories[index],
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .apply(color: Colors.black),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis))
                                  ])));
                        },
                      )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  const Text("Best Selling Product",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16.0),
                ],
              )),
        ],
      ),
    );
  }
}
