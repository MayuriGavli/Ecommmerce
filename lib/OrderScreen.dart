import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'Models/OrderModel.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => OrderScreenState();
}

class OrderScreenState extends State<OrderScreen> {
  bool dataFetched = false;
  var allOrderArray = [
    OrderModel(
        id: '',
        userId: '',
        userName: '',
        userShippingAddress: '',
        productName: '',
        productShippingDate: '')
  ];

  void getAllData() async {
    if (!dataFetched) {
      var order = await OrderModel.getAllOrderDetailOfUser();

      setState(() {
        allOrderArray = order;
        dataFetched = true;
      });

      print(order.length);
      print(allOrderArray.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    getAllData();
    dataFetched = false;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.1,
        title: const Text("My Order"),
        centerTitle: true,
        actions: const <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8)),
        ],
      ),
      body: OrderItems(allOrderArray.isNotEmpty ? allOrderArray : []),
    );
  }
}

class OrderItems extends StatelessWidget {
  OrderItems(this.allOrderArray, {super.key});

  var allOrderArray = [
    OrderModel(
        id: '',
        userId: '',
        userName: '',
        userShippingAddress: '',
        productName: '',
        productShippingDate: '')
  ];
  var todayDate = new DateTime.now();
  var newCurrentDate = '';
  var newShipmentDate = '';
  var newCurrentDate1 = 0;
  var newShipmentDate1 = 0;

  @override
  Widget build(BuildContext context) {
    var items = [
      {
        'orderID': '#0977',
        'Product_Name': 'Crop Top',
        'Shippment': 'Processing',
        'Shippment_value': '01 Feb 2024',
        'Shipping Date': '11 Feb 2024',
      },
      {
        'orderID': '#4322',
        'Product_Name': 'Sundress',
        'Shippment': '',
        'Shippment_value': '09 Feb 2024',
        'Shipping Date': '15 Feb 2024',
      },
      {
        'orderID': '#7588',
        'Product_Name': 'Anarkali',
        'Shippment': '',
        'Shippment_value': '3 Feb 2024',
        'Shipping Date': '10 Feb 2024',
      },
      {
        'orderID': '#5699',
        'Product_Name': 'Dungree',
        'Shippment': '',
        'Shippment_value': '28 Jan 2024',
        'Shipping Date': '11 Feb 2024',
      },
      {
        'orderID': '#5699',
        'Product_Name': 'Dungree',
        'Shippment': '',
        'Shippment_value': '28 Jan 2024',
        'Shipping Date': '11 Feb 2024',
      },
      {
        'orderID': '#5699',
        'Product_Name': 'Dungree',
        'Shippment': '',
        'Shippment_value': '28 Jan 2024',
        'Shipping Date': '11 Feb 2024',
      },
      {
        'orderID': '#5699',
        'Product_Name': 'Dungree',
        'Shippment': '',
        'Shippment_value': '28 Jan 2024',
        'Shipping Date': '11 Feb 2024',
      },
      {
        'orderID': '#5699',
        'Product_Name': 'Dungree',
        'Shippment': '',
        'Shippment_value': '28 Jan 2024',
        'Shipping Date': '11 Feb 2024',
      },
      {
        'orderID': '#5699',
        'Product_Name': 'Dungree',
        'Shippment': '',
        'Shippment_value': '28 Jan 2024',
        'Shipping Date': '11 Feb 2024',
      },
      {
        'orderID': '#5699',
        'Product_Name': 'Dungree',
        'Shippment': '',
        'Shippment_value': '28 Jan 2024',
        'Shipping Date': '11 Feb 2024',
      }
    ];

    String currentDate =
        '${todayDate.day}-${todayDate.month}-${todayDate.year}';
    void getDifferenceinDate(String ShipmentDate, int index) {
      print("ShipmentDate:-$ShipmentDate");
      print("currentDate:-$currentDate");
      print(ShipmentDate.length);
      print(currentDate.length);
      var newCurrentDate = currentDate.substring(0, currentDate.length - 8);
      var newShipmentDate = ShipmentDate.substring(0, currentDate.length - 8);
      print("newShipmentDate:= $newShipmentDate");
      var newCurrentDate1 = int.parse(newCurrentDate);
      var newShipmentDate1 = int.parse(newShipmentDate);
      if (newShipmentDate1 > newCurrentDate1) {
        // Product is still in processing
        items[index]['Shippment'] = 'Processing';
      } else {
        // Product has been delivered
        items[index]['Shippment'] = 'Delivered';
      }
    }

    if (allOrderArray.length > 1) {
      // Iterate through items to update 'Shippment' dynamically
      for (int i = 0; i < allOrderArray.length; i++) {
        getDifferenceinDate(allOrderArray[i].productShippingDate, i);
      }
    }

    return ListView.separated(
      shrinkWrap: true,
      itemCount: allOrderArray.length > 0 ? allOrderArray.length : 0,
      // itemCount: allOrderArray.length.compareTo(0),
      separatorBuilder: (_, __) => SizedBox(height: 16.0),
      itemBuilder: (_, index) => RoundedContainer(
        index,
        showBorder: true,
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Column1
            Row(
              children: [
                Row(
                  children: [
                    Icon(Iconsax.tag),
                    SizedBox(width: 16.0),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Product Name",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .apply(color: Colors.blue, fontWeightDelta: 1)),
                        // Text(items[index]['orderID'].toString(),
                        Text(
                            allOrderArray[index].productName.isNotEmpty
                                ? allOrderArray[index].productName
                                : 'Product',
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    )
                  ],
                ),
                SizedBox(width: 55.0),
                Row(
                  children: [
                    Icon(Iconsax.note),
                    SizedBox(width: 16.0),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Address",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .apply(color: Colors.blue, fontWeightDelta: 1)),
                        // Text(items[index]['Product_Name'].toString(),
                        Text(
                            allOrderArray[index].userShippingAddress.isNotEmpty
                                ? allOrderArray[index].userShippingAddress
                                : 'Address',
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    )
                  ],
                ),
              ],
            ),

            SizedBox(height: 15.0),

            //Column2
            Row(
              children: [
                Row(
                  children: [
                    Icon(Iconsax.ship),
                    SizedBox(width: 16.0),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //  newCurrentDate = currentDate.substring(0, currentDate.length - 7);
                        //  newShipmentDate = ShipmentDate.substring(0, currentDate.length - 7);
                        //  newCurrentDate1 = int.parse(newCurrentDate);
                        //  newShipmentDate1 = int.parse(newCurrentDate);
                        // print(newCurrentDate1);
                        // print(newShipmentDate1);
                        // if (newShipmentDate1 > newCurrentDate1){
                        //
                        // }

                        Text(items[index]['Shippment'].toString(),
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(color: Colors.blue,
                                    fontWeightDelta: 1)),
                            // Text(items[index]['Shippment_value'].toString(),
                            Text(currentDate,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleMedium),
                          ],
                        )
                      ],
                    ),
                    SizedBox(width: 80.0),
                    Row(
                      children: [
                        Icon(Iconsax.calendar),
                        SizedBox(width: 16.0),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shipping Date",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(color: Colors.blue,
                                    fontWeightDelta: 1)),
                            // Text(items[index]['Shipping Date'].toString(),
                            Text(
                                allOrderArray[index].productShippingDate
                                    .isNotEmpty
                                    ? allOrderArray[index].productShippingDate
                                    : 'Date',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleMedium),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(this.index,
      {super.key,
        this.child,
        this.width,
        this.height,
        this.margin,
        this.padding,
        this.showBorder = false,
        this.radius = 16.0,
        this.backgroundColor = Colors.white,
        this.borderColor = Colors.grey});

  final int index;
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
