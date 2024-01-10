//
// import 'dart:html';

// import 'dart:ui';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// static const IconData heart = IconData(0xf442, fontFamily: iconFont, fontPackage: iconFontPackage);

typedef void MyCallback(int foo);

class MyClass {
  void doSomething(int i) {}
}

class MyOtherClass {
  final MyCallback callback;

  MyOtherClass(this.callback);
}

void main() {
  runApp(const MaterialApp(
    home: homepage(),
  ));
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
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
        title: const Text("SHOPPING APP"),
        actions: <Widget>[
          Padding(
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
                accountName: const Text("Mayuri Gavli"),
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
          image_carousel,
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
                  TProductCardVertical(),
                ],
              )),
        ],
      ),
    );
  }
}

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(12),
        // boxShadow: [BoxShadow(color: Colors.tealAccent, blurRadius: 50, spreadRadius: 7, offset: Offset(0,2))],
      ),
      child: Column(
        children: [
          Troundedcontainer(
            height: 175,
            width: 300,
            padding: EdgeInsets.only(top: 10.0),
            backgroundColor: Colors.transparent,

            // thumbnail image
            child: Stack(
              children: [
                const Troundedimage(
                    imageUrl: "images/products/product1.jpeg",
                    applyImageRadius: true),

                //sale tag
                const Positioned(
                  top: 5,
                  left: 4,
                  child: Troundedcontainer(
                    radius: 12.0,
                    backgroundColor: Colors.amber,
                    // padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                    padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                    child: Text("25%"),
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
                          icon: Icon(Iconsax.heart5),
                          color: Colors.redAccent,
                        ))),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Grey T-shirt',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black),
                ),
                SizedBox(height: 2),
                Row(
                  children: const [
                    Text(
                      "Amazon",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black),
                    ),
                    SizedBox(width: 6),
                    Icon(
                      Iconsax.verify5,
                      color: Colors.blue,
                      size: 16,
                    )
                  ],
                ),
                SizedBox(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "\$200.0",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          )),
                      child: const SizedBox(
                        width: 30 * 1.2,
                        height: 30 * 1.2,
                        child: Center(
                            child: Icon(
                          Iconsax.add,
                          color: Colors.white,
                        )),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
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
      this.backgroundColor = Colors.lightBlue,
      this.fit = BoxFit.contain,
      this.padding,
      this.isNetworkImage = false,
      this.borderRadius = 16.0});

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

class TcircularIcon extends StatelessWidget {
  const TcircularIcon(
      {super.key,
      this.width,
      this.height,
      required this.icon,
      this.size = 16.0,
      this.onpressed,
      this.color,
      this.backgroundColor});

  final double? width, height, size;
  final Color? backgroundColor;
  final IconData icon;
  final Color? color;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // onTap: onPressed,
        child: Container(
      width: width,
      height: height,
      // decoration: BoxDecoration(color: backgroundColor != null? backgroundColor! THelperFunction.),
      // borderRadius: BorderRadius.circular(100),

      child: IconButton(
          onPressed: onpressed, icon: Icon(icon, color: color, size: size)),
    ));
  }
}
