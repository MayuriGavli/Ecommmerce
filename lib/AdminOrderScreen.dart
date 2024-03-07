import 'package:e_commmerce1/Models/OrderModel.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class AdminOrderScreen extends StatefulWidget {
  const AdminOrderScreen({super.key});

  @override
  State<AdminOrderScreen> createState() => AdminOrderScreenState();
}

class AdminOrderScreenState extends State<AdminOrderScreen> {
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
        title: const Text("ORDERS"),
        // centerTitle: true,

        actions: const <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8)),
        ],
      ),
      body: OrderItems(allOrderArray),
    );
  }
}

class OrderItems extends StatelessWidget {
  // const OrderItems( {super.key});
  OrderItems(this.allOrderArray, {super.key});

  @override
  var allOrderArray = [
    OrderModel(
        id: '',
        userId: '',
        userName: '',
        userShippingAddress: '',
        productName: '',
        productShippingDate: '')
  ];

  void showAlert(BuildContext context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      confirmBtnText: 'OK',
      text: "Order Dispatch Successfully",
    );
  }

  Widget build(BuildContext context) {
    var items = [
      {
        'orderID': '#0977',
        'Product_Name': 'Crop Top',
        'Shippment': 'Processing',
        'Shippment_value': '01 Feb 2024',
        'Shipping Date': '07 Feb 2024',
      },
      {
        'orderID': '#4322',
        'Product_Name': 'Sundress',
        'Shippment': 'Processing',
        'Shippment_value': '09 Feb 2024',
        'Shipping Date': '15 Feb 2024',
      },
      {
        'orderID': '#7588',
        'Product_Name': 'Anarkali',
        'Shippment': 'Processing',
        'Shippment_value': '3 Feb 2024',
        'Shipping Date': '10 Feb 2024',
      },
      {
        'orderID': '#5699',
        'Product_Name': 'Dungree',
        'Shippment': 'Delivered',
        'Shippment_value': '28 Jan 2024',
        'Shipping Date': '07 Feb 2024',
      },
      {
        'orderID': '#8766',
        'Product_Name': 'Gown',
        'Shippment': 'Delivered',
        'Shippment_value': '21 Jan 2024',
        'Shipping Date': '29 Jan 2024',
      },
      {
        'orderID': '#7899',
        'Product_Name': 'Kurti',
        'Shippment': 'Delivered',
        'Shippment_value': '24 Jan 2024',
        'Shipping Date': '1 Feb 2024',
      }
    ];
    return ListView.separated(
      shrinkWrap: true,
      itemCount: allOrderArray.isNotEmpty ? allOrderArray.length : 0,
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
                    Icon(Iconsax.note),
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
                        // Text(items[index]['Product_Name'].toString(),
                        Text(
                            allOrderArray[index].productName.isNotEmpty
                                ? allOrderArray[index].productName
                                : '',
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    )
                  ],
                ),
                SizedBox(width: 15.0),
                Row(
                  children: [
                    Icon(Iconsax.calendar),
                    SizedBox(width: 16.0),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("UserName",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .apply(color: Colors.blue, fontWeightDelta: 1)),
                        // Text(items[index]['Shipping Date'].toString(),
                        Text(
                            allOrderArray[index].userName.isNotEmpty
                                ? allOrderArray[index].userName
                                : '',
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
                        Text("User Address",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .apply(color: Colors.blue, fontWeightDelta: 1)),
                        // Text(items[index]['Shippment'].toString(),
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .bodyLarge!
                        //         .apply(color: Colors.blue, fontWeightDelta: 1)),
                        // Text(items[index]['Shippment_value'].toString(),
                        Text(
                            allOrderArray[index].userShippingAddress.isNotEmpty
                                ? allOrderArray[index].userShippingAddress
                                : '',
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    )
                  ],
                ),
                SizedBox(width: 50.0),
                SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // background color
                      foregroundColor: Colors.white, // text color
                    ),
                    onPressed: () {
                      // appSingletonInstance.showToast('Product Dispatched');
                      showAlert(context);
                    },
                    child: Text("Dispatch"),
                  ),
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
