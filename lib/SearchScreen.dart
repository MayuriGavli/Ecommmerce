import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'DetailProductScreen.dart';
import 'Models/ProductDetailsModel.dart';
import 'Singleton/AppSingleton.dart';

//
// class AppBar extends StatelessWidget implements PreferredSizeWidget{
//   const AppBar({super.key,this.title,this.showbackArrow=false,this.leadingIcon,this.actions,this.leadingOnPressed,});
//
//   final Widget? title;
//   final bool showbackArrow;
//   final IconData? leadingIcon;
//   final List<Widget>? actions;
//   final VoidCallback? leadingOnPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),
//       child: AppBar(
//         auto
//         leading : showbackArrow? IconButton(onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left): leadin)
//       ),
//     );
//   }
// }

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
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
      DateTime today = new DateTime.now();
      // DateTime date = new DateTime(now.year, now.month, now.day);
      print("${today.day}-${today.month}-${today.year}");

      var futureDate = today.day + 1;
      print(futureDate);
      print("${futureDate}-${today.month}-${today.year}");
      print('+++++++++++++++++');
    }

    getAllData();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: const Text("Search Product"),
        backgroundColor: Colors.blue,
        actions: const <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                DropdownButtonFormField(
                    decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                    onChanged: (value) {},
                    items: [
                      'T-Shirt',
                      'White Lehnaga',
                      'White Shirt',
                      'Sadi',
                      'Sari',
                      'JumpSuit',
                      'Anarkali'
                    ]
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList()),
                SizedBox(
                  height: 16.0,
                ),
                GridView.builder(
                  itemCount:
                      allProductArray.length > 1 ? allProductArray.length : 1,
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
              width: 900,
              // padding: const EdgeInsets.only(left: 20,top: 7),
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
                    left: 5,
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

//1 way=================================================
// class SearchScreen extends SearchDelegate {
//   List<String> SearchTerms = [
//     'Sundress',
//     'Dungree',
//     'Kurti',
//     'Crop Top',
//     'Sari',
//     'Lehnaga',
//     'JumpSuit'
//   ];
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//           // When pressed here the query will be cleared from the search bar.
//         },
//       ),
//     ];
//     // Build the clear button.
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () => Navigator.of(context).pop(),
//       // Exit from the search screen.
//     );
//     // Build the leading icon.
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     final List<String> searchResults = SearchTerms.where(
//         (item) => item.toLowerCase().contains(query.toLowerCase())).toList();
//     return ListView.builder(
//       itemCount: searchResults.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(searchResults[index]),
//           onTap: () {
//             // Handle the selected search result.
//             close(context, searchResults[index]);
//           },
//         );
//       },
//     );
//     // Build the search results.
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final List<String> suggestionList = query.isEmpty
//         ? []
//         : SearchTerms.where(
//                 (item) => item.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//
//     return ListView.builder(
//       itemCount: suggestionList.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(suggestionList[index]),
//           onTap: () {
//             query = suggestionList[index];
//             // Show the search results based on the selected suggestion.
//           },
//         );
//       },
//     );
//   }
// }
//===============================================
// 2nd way
// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//  var items = ['Sundress','Dungree','Kurti','Crop Top','Sari','Lehnaga','JumpSuit'];
//
//   List<String> filteredItems = [];
//
//   @override
//   void initState() {
//     super.initState();
//     filteredItems.addAll(items);
//   }
//
//   void filterList(String query) {
//     List<String> searchResult = items
//         .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//
//     setState(() {
//       filteredItems.clear();
//       filteredItems.addAll(searchResult);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Screen'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onChanged: filterList,
//               decoration: InputDecoration(
//                 labelText: 'Search',
//                 hintText: 'Enter your search query...',
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredItems.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(filteredItems[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
