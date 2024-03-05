import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commmerce1/DetailProductScreen.dart';
import 'package:e_commmerce1/Models/ProductDetailsModel.dart';
import 'package:e_commmerce1/SearchScreen.dart';
import 'package:e_commmerce1/Singleton/AppSingleton.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});

  @override
  State<HomePage> createState() => HomepageState();
}

class HomepageState extends State<HomePage> {
  var allProductArray = [];

  @override
  Widget build(BuildContext context) {
    //For GetAllProductData
    void getAllData() async {
      var product = await ProductDetailsModel.getAllProductDetail();
      if (allProductArray.length == 0) {
        //add data
        product.forEach((element) {
          allProductArray.add(element);
        });
      } else if (allProductArray.length == product.length) {
        //dont do anythinhg
      } else if (allProductArray.length >= product.length) {
        // extra data
        allProductArray.removeRange(0, allProductArray.length);
        getAllData();
      }
      print('+++++++++++++++++');
      print(product.length);
      print(allProductArray.length);
    }

    getAllData();

    Widget imageCarousel = Container(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
            items: const [
              Troundedimage(
                imageUrl: 'images/products/sale.png',
                width: 350,
              ),
              Troundedimage(
                imageUrl: 'images/products/sale2.png',
                width: 350,
              ),
              Troundedimage(
                imageUrl: 'images/products/sale3.png',
                width: 350,
              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: const Text("SHOPPING APP"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          const Padding(
              padding: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
                // showSearch(context: context, delegate: _SearchScreenState());
              },
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

      body: ListView(
        // child: Column(
        children: <Widget>[
          const SizedBox(height: 10.0),
          imageCarousel,
          Padding(
              padding: EdgeInsets.all(1.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10.0),
                  const Text("  Popular Categories",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20.0),
                  SizedBox(
                      height: 80,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 9,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          var categories = [
                            '     Anarkali',
                            '      Denim',
                            '     Dungree',
                            '      Gowns',
                            '        Kurti',
                            '  '
                                '      Sari',
                            '     Shorts',
                            '      Skirts',
                            '   Sundress'
                          ];

                          var images = [
                            'images/category/anarkali_crop.png',
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
                                  padding: const EdgeInsets.only(right: 10.0),
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
                                            fit: BoxFit.fill)),
                                    const SizedBox(height: 5.0),
                                    SizedBox(
                                        width: 70,
                                        // height: 10,
                                        child: Text(
                                          categories[index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10),
                                          maxLines: 4,
                                          // overflow: TextOverflow.ellipsis
                                        ))
                                  ])));
                        },
                      )),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  const Text("  Best Selling Product",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10.0),
                  GridView.builder(
                    itemCount:
                        allProductArray.length > 1 ? allProductArray.length : 1,
                    // itemCount: 6,
                    shrinkWrap: true,
                    // padding: const EdgeInsets.only(left: 2, right: 2),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      mainAxisExtent: 253,
                    ),
                    itemBuilder: (_, index) =>
                        TProductCardVertical(index, allProductArray),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class TProductCardVertical extends StatelessWidget {
  TProductCardVertical(this.index, this.allProductArray, {super.key});

  final int index;
  var isfavarate;
  Color _iconColor = Colors.white;
  var allProductArray = [];

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
        'isFavorite': 'true',
      },
      {
        'name': 'White Lehnaga',
        'company_name': 'Flipcart',
        'is_company_verified': false,
        'price': "\$500.00",
        'image': 'images/products/LEHNAGA.png',
        'discount': '10%',
        'isFavorite': 'false',
      },
      {
        'name': 'White Shirt',
        'company_name': 'Meesho',
        'is_company_verified': false,
        'price': "\$500.00",
        'image': 'images/products/longskirt.png',
        'discount': '50%',
        'isFavorite': 'false',
      },
      {
        'name': 'Sadi',
        'company_name': 'Amazon',
        'is_company_verified': false,
        'price': "\$500.00",
        'image': 'images/products/sadi.png',
        'discount': '30%',
        'isFavorite': 'false',
      },
      {
        'name': 'JumpSuit',
        'company_name': 'Meesho',
        'is_company_verified': false,
        'price': "\$500.00",
        'image': 'images/products/jumsuit.png',
        'discount': '10%',
        'isFavorite': 'false',
      },
      {
        'name': 'Anarkali',
        'company_name': 'Flipcart',
        'is_company_verified': false,
        'price': "\$500.00",
        'image': 'images/products/anarkali.png',
        'discount': '20%',
        'isFavorite': 'false',
      },
    ];

    void getAllData() async {
      var product = await ProductDetailsModel.getAllProductDetail();
      if (allProductArray.length == 0) {
        //add data
        product.forEach((element) {
          allProductArray.add(element);
        });
      } else if (allProductArray.length == product.length) {
        //dont do anythinhg
      } else if (/*allProductArray.length >= product.length || */ allProductArray
              .length ==
          1) {
        // extra data
        allProductArray.removeRange(0, allProductArray.length);
        getAllData();
      }
      print('&&&&&&&&&&&&&&&&&&&&&');
      print(product.length);
      print(allProductArray.length);
      print('&&&&&&&&&&&&&&&&&&&&&');
    }
    // getAllData();

    if (this.allProductArray.length > 0) {
      allProductArray = this.allProductArray;
    } else {
      allProductArray = [
        ProductDetailsModel(
            ProductName: 'dummy',
            CompanyName: '',
            Discount: '',
            ProductPrice: '',
            imageURL: '')
      ];
    }
    print('==============================');
    print(allProductArray);
    print(allProductArray.length);
    print('==============================');
    if (allProductArray.length == 1) {
      getAllData();
    }

    // allProductArray.forEach((element) {
    //   print('==============================');
    //   print(element.ProductName);
    //   print('==============================');
    // });

    // print(AllProductDetail);
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
              height: 170,
              width: 990,
              padding: const EdgeInsets.only(left: 2, right: 2),
              backgroundColor: Colors.transparent,
              // thumbnail image
              child: Stack(
                children: [
                  Troundedimage(
                    onPressed: () {
                      appSingletonInstance.productDetailToEdit =
                          allProductArray[index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailProductsScreen()),
                      );
                    },
                    // imageUrl: items[index]['image'].toString(),
                    imageUrl: allProductArray[index].imageURL,
                    applyImageRadius: true,
                    padding: EdgeInsets.only(top: 15, left: 30),
                  ),

                  //sale tag
                  Positioned(
                    top: 5,
                    left:5,
                    child: Troundedcontainer(
                      radius: 12.0,
                      backgroundColor: Colors.amber,
                      // padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                      // child: Text(items[index]['discount'].toString()), // Old Array Code
                      child: Text(allProductArray[index].Discount),
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

                              // icon: Icon(Icons.star, color: _iconColor),
                              icon: isfavarate == true
                                  ? Icon(
                                      Iconsax.heart5,
                                      color: _iconColor,
                                    )
                                  : Icon(Iconsax.heart),
                              onPressed: () {
                                isfavarate =
                                    items[index]['isFavorite'] == 'false'
                                        ? 'true'
                                        : 'false';
                              })))

                  // onPressed: () {
                  //   isfavarate = items[index]['isFavorite'] == 'false' ? 'true' : 'false';
                  //   print(isfavarate);
                  //    items[index]['isFavorite'] = isfavarate.toString();
                  //
                  //         // }, icon: items[index]['isFavorite'] == true ? const Icon(Iconsax.heart5) : const Icon(Iconsax.heart),
                  //         }, icon: isfavarate == true ? const Icon(Iconsax.heart5) : const Icon(Iconsax.heart),
                  //
                  // // color: items[index]['isFavorite'] == true
                  // color: isfavarate == true
                  //     ? Colors.redAccent
                  //     : Colors.white,
                  //   ))),
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
                    // items[index]['name'].toString(),// Old Array Code
                    allProductArray[index].ProductName,
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
                        // items[index]['company_name'].toString(), // Old Array Code
                        allProductArray[index].CompanyName,
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
                        // items[index]['price'].toString(), //Old Array Code
                        allProductArray[index].ProductPrice,
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
                            color: Colors.blue,
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
      ),
    ) ;
  }
}

class Troundedcontainer extends StatelessWidget {
  const Troundedcontainer({super.key,
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
  const Troundedimage({super.key,
    this.onPressed,
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

  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
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
  const TcircularIcon({super.key,
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

