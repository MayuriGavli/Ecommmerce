import 'dart:core';

import 'package:e_commmerce1/Navigation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quickalert/quickalert.dart';

import 'Models/OrderModel.dart';
import 'Singleton/AppSingleton.dart';

class BuyNowScreen extends StatefulWidget {
  const BuyNowScreen({super.key});

  @override
  BuyNowScreenState createState() => BuyNowScreenState();
}

class BuyNowScreenState extends State<BuyNowScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _ShippingAddressController = TextEditingController();
  final _PaymentMethodController = TextEditingController();
  final _PriceController = TextEditingController();

  bool _passwordVisible = false;
  bool _agreedToTerms = false;

  String imageURL = '';
  var productDetailModelObject = appSingletonInstance.productDetailToEdit;

  @override
  void initState() {
    _PaymentMethodController.text = 'Cash On Delivery';
    _PriceController.text = productDetailModelObject.ProductPrice;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.1,
        title: const Text("Payment Screen"),
        leading: IconButton(
          onPressed: () {},
          icon: IconButton(
            icon: Icon(Iconsax.arrow_left),
            onPressed: () {
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Navigation()),
              // );
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
        child: Padding(
          padding: const EdgeInsets.only(
              top: 40.0, left: 20.0, bottom: 24.0, right: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 1),
                  ],
                ),
                const SizedBox(height: 20.0),
                Column(
                  children: [
                    //shipping address
                    TextFormField(
                      controller: _ShippingAddressController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          labelText: "Shipping Address"),
                      validator: (name) {
                        if (name!.isEmpty) {
                          return 'Enter Valid Shipping Address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    //payment method

                    TextFormField(
                      // productDetailModelObject.ProductPrice,
                      enabled: false,

                      controller: _PaymentMethodController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.payment),
                          border: OutlineInputBorder(),
                          labelText: "Payment Method"),
                      validator: (name) {
                        if (name!.isEmpty) {
                          return 'Enter Valid Payment Method';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16.0),

                    //Price
                    TextFormField(
                      enabled: false,
                      controller: _PriceController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.currency_rupee),
                          border: OutlineInputBorder(),
                          labelText: "Price"),
                      validator: (name) {
                        if (name!.isEmpty) {
                          return 'Enter Valid Price';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    //create new account
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Check if the form is valid and terms are agreed
                          if (_formKey.currentState!.validate()) {
                            _bookProduct();
                            showAlert(context);
                            // // ScaffoldMessenger.of(context)
                            // //     .showSnackBar(const SnackBar(
                            // //   content: Text("Product Added Successfully"),
                            // // ));
                            // _submitForm();
                          }
                        },
                        child: const Text("Success"),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          // Navigate to the SignupScreen
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAlert(BuildContext context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      confirmBtnText: 'Continue Shopping',
      onConfirmBtnTap: () {
        _handleContinueShopping(context);
      },
      text: "Order Booked Successfully",
    );
  }

  void _handleContinueShopping(BuildContext context) {
    // Do something when the "Continue Shopping" button is pressed
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Navigation()),
    );
  }

  void _bookProduct() async {
    var todayDate = new DateTime.now();
    String productShippingDate =
        '${todayDate.day + 1}-${todayDate.month}-${todayDate.year}';
    String userName = appSingletonInstance.userDataFromSingleton.userName;
    String userShippingAddress = _ShippingAddressController.text;
    String userPaymentMethod = _PaymentMethodController.text;
    String productName = productDetailModelObject.ProductName;
    String userId = appSingletonInstance.userDataFromSingleton.id;

    var orderData = OrderModel(
        userId: userId,
        userName: userName,
        userShippingAddress: userShippingAddress,
        productName: productName,
        productShippingDate: productShippingDate);

    OrderModel.addOrderDetail(orderData);
    print('Data Added Successfully');
  }

}
