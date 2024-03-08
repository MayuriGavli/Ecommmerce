import 'package:e_commmerce1/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'Models/ProductDetailsModel.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => FavoriteScreenState();
}

class FavoriteScreenState extends State<FavoriteScreen> {
  bool dataFetched = false;
  var allProductArray = [
    ProductDetailsModel(
        ProductName: 'dummy1',
        CompanyName: '',
        Discount: '',
        ProductPrice: '',
        imageURL: '',
        isLiked: false)
  ];

  void getAllFavoriteData() async {
    if (!dataFetched) {
      var product = await ProductDetailsModel.getAllFavoriteProduct();

      setState(() {
        allProductArray = product;
        dataFetched = true;
      });

      print('+++++++++++++++++');
      print(allProductArray.length);
      print('+++++++++++++++++');
    }
  }

  @override
  Widget build(BuildContext context) {
    getAllFavoriteData();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.1,
        title: const Text("FAVOURITE"),
        // centerTitle: true,

        actions: const <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8)),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  GridView.builder(
                    itemCount:
                        allProductArray.length > 1 ? allProductArray.length : 0,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
        ],
      ),
    );
  }
}

class TProductCardVertical extends StatelessWidget {
  TProductCardVertical(this.index, this.allProductArray, {super.key});

  final int index;
  List<ProductDetailsModel> allProductArray;

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
        'image': 'images/products/skirt.png',
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
                    // imageUrl: items[index]['image'].toString(),
                    imageUrl: allProductArray[index].imageURL,
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
                            onPressed: () {},
                            icon: allProductArray[index].isLiked
                                ? const Icon(Iconsax.heart5)
                                : const Icon(Iconsax.heart5),
                            color: allProductArray[index].isLiked
                                ? Colors.redAccent
                                : Colors.white,
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
                        // items[index]['company_name'].toString(),
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
                        // items[index]['price'].toString(),
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
      ),
    );
  }
}
