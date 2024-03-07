import 'package:e_commmerce1/PaymentScreen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'Singleton/AppSingleton.dart';

class DetailProductsScreen extends StatelessWidget {
  const DetailProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var productDetailModelObject = appSingletonInstance.productDetailToEdit;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.1,
        title: const Text(""),
        leading: IconButton(
          onPressed: () {},
          icon: IconButton(
            icon: Icon(Iconsax.arrow_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        // centerTitle: true,

        actions: const <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TCurvedWidget(
              child: Container(
                child: Stack(children: [
                  Troundedimage(
                    width: 350,
                    height: 400,
                    // imageUrl: items[index]['image'].toString(),
                    imageUrl: productDetailModelObject.imageURL,
                    applyImageRadius: true,
                    padding: EdgeInsets.only(top: 10, left: 20),
                  ),
                  // const SizedBox(
                  //   height: 400,
                  //   child: Padding(
                  //       padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                  //       child: Center(
                  //         child:Image(image: AssetImage('images/products/anarkali.png')),
                  //       )),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: 24.0, left: 24.0, bottom: 24.0, top: 420),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            // 5 star
                            Row(
                              children: [
                                Icon(Iconsax.star5,
                                    color: Colors.amber, size: 25),
                                SizedBox(height: 16.0),
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: '  5.0',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ]))
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Troundedcontainer(
                              radius: 12,
                              backgroundColor: Colors.yellow,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Text(
                                productDetailModelObject.Discount,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Row(
                              children: [
                                Text(
                                  productDetailModelObject.ProductPrice,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        Row(
                          children: [
                            Text(
                              productDetailModelObject.ProductName,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontFamily: 'RobotoMono',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),

                        Row(
                          children: [
                            Text(
                              productDetailModelObject.CompanyName,
                              style: TextStyle(
                                  fontFamily: 'RobotoMono',
                                  fontStyle: FontStyle.normal,
                                  fontSize: 17,
                                  color: Colors.black),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Iconsax.verify5,
                              color: Colors.blue,
                              size: 16,
                            )
                          ],
                        ),
                        const SizedBox(height: 35.0),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // background color
                              foregroundColor: Colors.white, // text color
                            ),
                            onPressed: () {
                              //Check if the form is valid and terms are agreed
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentScreen()),
                              );
                            },
                            child: const Text("BUY NOW"),
                          ),
                        ),

                        //create new account
                        // SizedBox(
                        //   width: double.infinity,
                        //   child: OutlinedButton(
                        //     onPressed: () {
                        //       Fluttertoast.showToast(
                        //           msg: "Product is Added To Card",
                        //           toastLength: Toast.LENGTH_SHORT,
                        //           gravity: ToastGravity.BOTTOM,
                        //           timeInSecForIosWeb: 2,
                        //           backgroundColor: Colors.blue,
                        //           textColor: Colors.white,
                        //           fontSize: 16.0);
                        //     },
                        //     child: Text("Add To Cart"),
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.blue,
        isDismissible: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (context) => Container(
              height: 200,
            ));
  }
}

//
// class DetailProductsScreen extends StatefulWidget {
//   const DetailProductsScreen({super.key});
//
//   @override
//   State<DetailProductsScreen> createState() => _DetailProductsScreenState();
// }
//
// class _DetailProductsScreenState extends State<DetailProductsScreen> {
// var productDetailModelObject = appSingletonInstance.productDetailToEdit;
//
// @override
//   Widget build(BuildContext context) {
//     var productDetailModelObject = appSingletonInstance.productDetailToEdit;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         elevation: 0.1,
//         title: const Text(""),
//         leading: IconButton(
//           onPressed: () {},
//           icon: IconButton(
//             icon: Icon(Iconsax.arrow_left),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         // centerTitle: true,
//
//         actions: const <Widget>[
//           Padding(
//               padding: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8)),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TCurvedWidget(
//               child: Container(
//                 child: Stack(children: [
//                   Troundedimage(
//                     // imageUrl: items[index]['image'].toString(),
//                     imageUrl: productDetailModelObject.imageURL,
//                     applyImageRadius: true,
//                     padding: EdgeInsets.only(top: 10, left: 20),
//                   ),
//                   // const SizedBox(
//                   //   height: 400,
//                   //   child: Padding(
//                   //       padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
//                   //       child: Center(
//                   //         child:Image(image: AssetImage('images/products/anarkali.png')),
//                   //       )),
//                   // ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                         right: 24.0, left: 24.0, bottom: 24.0, top: 420),
//                     child: Column(
//                       children: [
//                         const Row(
//                           children: [
//                             // 5 star
//                             Row(
//                               children: [
//                                 Icon(Iconsax.star5,
//                                     color: Colors.amber, size: 25),
//                                 SizedBox(height: 16.0),
//                                 Text.rich(TextSpan(children: [
//                                   TextSpan(
//                                       text: '  5.0',
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w500,
//                                       )),
//                                 ]))
//                               ],
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 8),
//                         const Row(
//                           children: [
//                             Troundedcontainer(
//                               radius: 12,
//                               backgroundColor: Colors.yellow,
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 8, vertical: 8),
//                               child:
//                               Text(
//                                 '35%',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             Row(
//                               children: [
//                                 Text(
//                                   '\$500',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 8),
//
//                         const Row(
//                           children: [
//                             Text(
//                               'Sari',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.black,
//                                 fontFamily: 'RobotoMono',
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             )
//                           ],
//                         ),
//                         const SizedBox(height: 8),
//
//                         const Row(
//                           children: [
//                             Text(
//                               'Parampara',
//                               style: TextStyle(
//                                   fontFamily: 'RobotoMono',
//                                   fontStyle: FontStyle.normal,
//                                   fontSize: 17,
//                                   color: Colors.black),
//                             ),
//                             SizedBox(width: 4),
//                             Icon(
//                               Iconsax.verify5,
//                               color: Colors.blue,
//                               size: 16,
//                             )
//                           ],
//                         ),
//                         const SizedBox(height: 16.0),
//
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               //Check if the form is valid and terms are agreed
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => BuyNowScreen()),
//                               );
//                             },
//                             child: const Text("BUY NOW"),
//                           ),
//                         ),
//
//                         const SizedBox(height: 16.0),
//
//                         //create new account
//                         SizedBox(
//                           width: double.infinity,
//                           child: OutlinedButton(
//                             onPressed: () {
//                               Fluttertoast.showToast(
//                                   msg: "Product is Added To Card",
//                                   toastLength: Toast.LENGTH_SHORT,
//                                   gravity: ToastGravity.BOTTOM,
//                                   timeInSecForIosWeb: 2,
//                                   backgroundColor: Colors.blue,
//                                   textColor: Colors.white,
//                                   fontSize: 16.0);
//                             },
//                             child: Text("Add To Cart"),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ]),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future _displayBottomSheet(BuildContext context) {
//     return showModalBottomSheet(
//         context: context,
//         backgroundColor: Colors.blue,
//         isDismissible: false,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
//         builder: (context) => Container(
//           height: 200,
//         ));
//   }
//   }

// class DetailProductScreeen extends StatefulWidget {
//   const DetailProductScreeen({super.key});
//
//   @override
//   State<DetailProductScreeen> createState() => _DetailProductScreeenState();
// }

// class _DetailProductScreeenState extends State<DetailProductScreeen> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TCurvedWidget(child: Container())
//           ],
//         ),
//       ),
//     );
//   }
// }
class TCurvedWidget extends StatelessWidget {
  const TCurvedWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: child,
    );
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
