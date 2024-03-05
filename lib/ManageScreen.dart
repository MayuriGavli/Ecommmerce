import 'package:e_commmerce1/Singleton/AppSingleton.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'AddProductScreen.dart';
import 'EditProductScreen.dart';
import 'Models/ProductDetailsModel.dart';

class ManageScreen extends StatefulWidget {
  const ManageScreen({super.key});

  @override
  State<ManageScreen> createState() => ManageScreenState();
}

class ManageScreenState extends State<ManageScreen> {
  var allProductArray = [
    ProductDetailsModel(
        id: '',
        ProductName: '',
        CompanyName: '',
        Discount: '',
        ProductPrice: '',
        imageURL: '')
  ];

  @override
  Widget build(BuildContext context) {
    getAllData();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.1,
        title: const Text("MANAGE"),
        // centerTitle: true,

        actions: const <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8)),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductScreen()),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
      body: _load(allProductArray),
    );
  }

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
    } else if (allProductArray.length == 1 ||
        product.length != allProductArray.length) {
      // extra data
      allProductArray.removeRange(0, allProductArray.length);
      getAllData();
    }
    print('+++++++++++++++++');
    print(product.length);
    print(allProductArray.length);
    print('+++++++++++++++++');
  }
}

Widget _load(List<ProductDetailsModel> allProductArray) {
  return ListView(
    children: <Widget>[
      Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              GridView.builder(
                itemCount:
                    allProductArray.length > 0 ? allProductArray.length : 0,
                // itemCount: 0,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 5, right: 5),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  mainAxisExtent: 253,
                ),
                itemBuilder: (_, index) =>
                    TProductCardVertical(index, allProductArray),
              )
            ],
          )),
      Divider(),
    ],
  );
}

class TProductCardVertical extends StatelessWidget {
  TProductCardVertical(this.index, this.allProductArray, {super.key});

  final int index;
  var allProductArray = [
    ProductDetailsModel(
        id: '',
        ProductName: '',
        CompanyName: '',
        Discount: '',
        ProductPrice: '',
        imageURL: '')
  ];

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

    if (this.allProductArray.length > 0) {
      allProductArray = this.allProductArray;
    }

    //Product Delete Function
    void deleteProduct(ProductDetailsModel productData) async {
      await ProductDetailsModel.deleteProductRecord(productData);
      appSingletonInstance.showToast('Product Deleted Successfully');
      print('Product Deleted Successfully');
    }

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
                    // imageUrl: items[index]['image'].toString(),
                    imageUrl: allProductArray[index].imageURL.isNotEmpty
                        ? allProductArray[index].imageURL
                        : items[index]['image'].toString(),
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
                      // child: Text(items[index]['discount'].toString()),
                      child: Text(allProductArray.length > 0
                          ? allProductArray[index].Discount
                          : ''),
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
                            onPressed: () {
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
                                                deleteProduct(
                                                    allProductArray[index]);
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Yes"))
                                        ],
                                        title: Text("Delete Product"),
                                        contentPadding: EdgeInsets.all(20.0),
                                        content: Text(
                                            " Are you sure you want to delete this product?"),
                                      ));
                            },
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
                    // items[index]['name'].toString(),
                    allProductArray.length > 0
                        ? allProductArray[index].ProductName
                        : '',
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
                        // items[index]['company_name'].toString(),
                        allProductArray.length > 0
                            ? allProductArray[index].CompanyName
                            : '',
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
                        // items[index]['price'].toString(),
                        allProductArray.length > 0
                            ? allProductArray[index].ProductPrice
                            : '',
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
                              appSingletonInstance.productDetailToEdit =
                                  allProductArray[index];
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
