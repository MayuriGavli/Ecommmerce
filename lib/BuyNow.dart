import 'dart:core';
// import 'dart:html';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commmerce1/Navigation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';

import 'Models/BuyNowDetailsModel.dart';

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

  File? _selectedImage;
  File? _nameImageName;

  @override
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

                    //phone number
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                          labelText: "Phone Number"),
                      keyboardType: TextInputType.phone,
                      validator: (phone) {
                        if (phone!.isEmpty) {
                          return 'Enter Valid Phone Number';
                        } else if (!RegExp(r'^[0-9]{10}$').hasMatch(phone)) {
                          return 'Enter a valid 10-digit Phone Number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    //payment method

                    TextFormField(
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
                            _AddProduct();
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

  void _AddProduct() async {
    String Phone = _phoneController
        .text; //here ypu have to change name and have to create new user model
    String ShippingAddress = _ShippingAddressController.text;
    String PaymentMethod = _PaymentMethodController.text;
    String ProductPrice = _PriceController.text;

    //new Code of HR
    // Harsha - 28-02-24 - Inserted the data into firebase table named as 'User'
    final productTableObject = FirebaseFirestore.instance
        .collection('PaymentDetails')
        .doc(); //get the user table and made object
    final productData = PaymentDetailsModel(
        id: productTableObject.id,
        ShippingAddress: ShippingAddress,
        phone: Phone,
        PaymentMethod: PaymentMethod,
        ProductPrice: ProductPrice);
    //making an object of user data
    final jsonData = productData.toJson(); // Converted the userdata into json
    await productTableObject.set(jsonData).then((obj) {
      //checking if the data is inserted oor not
      print("data inserted succesfully");
      print("=================");
      print(productTableObject.id);
      print("=================");
      // Navigator.of(context).pop();
    }).catchError((onError) {
      print(onError);
    });
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(returnedImage!.path);
      _nameImageName = File(returnedImage!.name);
    });
  }

// void _submitForm() {
//   // Perform the form submission logic here
//   String name = _ProductnameController.text;
//   String email = _CompanynameController.text;
//   String phone = _DiscountController.text;
//   String password = _PriceController.text;
//
//   // For demonstration purposes, just print the form data
//   print('Name: $name');
//   print('Email: $email');
//   print('Phone: $phone');
//   print('Password: $password');
//
//   // Add your logic to handle the form submission
// }
}
