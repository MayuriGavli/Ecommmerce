import 'dart:core';
// import 'dart:html';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commmerce1/Models/ProductDetailsModel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  AddProductScreenState createState() => AddProductScreenState();
}

class AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _ProductnameController = TextEditingController();
  final _CompanynameController = TextEditingController();
  final _DiscountController = TextEditingController();
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
        elevation: 0.1,
        title: const Text("Add Product"),
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
                    //Company Name
                    TextFormField(
                      controller: _CompanynameController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          labelText: "Company Name"),
                      validator: (name) {
                        if (name!.isEmpty) {
                          return 'Enter Valid Company Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    //Product Name
                    TextFormField(
                      controller: _ProductnameController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.shopping_cart_checkout),
                          border: OutlineInputBorder(),
                          labelText: "Product Name"),
                      validator: (name) {
                        if (name!.isEmpty) {
                          return 'Enter Valid Product Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    //Sale Tag
                    TextFormField(
                      controller: _DiscountController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.discount),
                          border: OutlineInputBorder(),
                          labelText: "Discount"),
                      keyboardType: TextInputType.phone,
                      validator: (phone) {
                        if (phone!.isEmpty) {
                          return 'Enter Valid Sale Tag';
                        } else if (!RegExp(r'^[0-9]{2}%').hasMatch(phone)) {
                          return 'Enter a valid Sale Tag';
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
                    Stack(
                      children: [
                        _selectedImage != null
                            ? CircleAvatar(
                                radius: 65,
                                backgroundImage:
                                    (Image.file(_selectedImage!)).image)
                            : CircleAvatar(
                                radius: 65,
                                backgroundImage:
                                    Image.asset('images/logo/pro.png').image,
                              )
                        // _selectedImage != null ? CircleAvatar(radius: 64,backgroundImage: (Image.file(_selectedImage!)).image) : CircleAvatar(backgroundImage: (Image.file(File('/Users/dipakgavali/Library/Developer/CoreSimulator/Devices/54D06B67-CD1F-4491-BA66-FB864C6C5A91/data/Containers/Data/Application/652270BB-6C0B-4D89-B64C-F19A8AAF6122/tmp/image_picker_C75E13AA-6BA8-49F9-905A-19C79953EC38-28476-00000057FBA3DD3D.jpg'))).image,)
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet()));
                        },
                        child: Text("Upload Image")),

                    const SizedBox(height: 16.0),

                    //create new account
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Check if the form is valid and terms are agreed
                          if (_formKey.currentState!.validate()) {
                            _AddProduct();
                            Fluttertoast.showToast(
                                msg: "Product Added Successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.blue,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            // // ScaffoldMessenger.of(context)
                            // //     .showSnackBar(const SnackBar(
                            // //   content: Text("Product Added Successfully"),
                            // // ));
                            // _submitForm();
                          }
                        },
                        child: const Text("Save"),
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

  void _AddProduct() async {
    String ProductName = _ProductnameController.text;
    String CompanyName = _CompanynameController.text;
    String Discount = _DiscountController.text;
    String ProductPrice = _PriceController.text;

    //new Code of HR
    // Harsha - 28-02-24 - Inserted the data into firebase table named as 'User'
    final productTableObject = FirebaseFirestore.instance
        .collection('Product')
        .doc(); //get the user table and made object

    var imageTrimedFromFirst =
        _selectedImage.toString().substring(7); //Trim Image From first
    var finalImageAfterTrimFromBack = imageTrimedFromFirst.substring(
        0, imageTrimedFromFirst.length - 1); //Trim Image from Back
    print(finalImageAfterTrimFromBack);

    final productData = ProductDetailsModel(
        id: productTableObject.id,
        ProductName: ProductName,
        CompanyName: CompanyName,
        Discount: Discount,
        ProductPrice: ProductPrice,
        imageURL: finalImageAfterTrimFromBack.toString());

    final jsonData = productData.toJson(); // Converted the userdata into json
    await productTableObject.set(jsonData).then((obj) {
      //checking if the data is inserted oor not
      print("data inserted succesfully");
      print("=================");
      print(productTableObject.id);
      print("=================");
      Navigator.of(context).pop();
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

  Widget bottomSheet() {
    return Container(
      height: 140.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: <Widget>[
        const Text("Choose Profile Photo", style: TextStyle(fontSize: 20.0)),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
                onPressed: () {
                  ImagePicker imagePicker = ImagePicker();
                  imagePicker.pickImage(source: ImageSource.camera);
                },
                icon: Icon(Iconsax.camera),
                label: Text("Camera")),
            TextButton.icon(
                onPressed: () async {
                  _pickImageFromGallery();

                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirImage = referenceRoot.child("Product");

                  if (File == null) return;

                  String UniqueFilename =
                      DateTime.now().microsecondsSinceEpoch.toString();

                  Reference referenceImageToUpload =
                      referenceDirImage.child('${UniqueFilename}');

                  try {
                    await referenceImageToUpload.putFile(_selectedImage!);
                    imageURL = await referenceImageToUpload.getDownloadURL();
                  } catch (error) {}
                },
                icon: Icon(Iconsax.gallery),
                label: Text("Gallery")),
          ],
        ),
      ]),
    );
  }

  void _submitForm() {
    // Perform the form submission logic here
    String name = _ProductnameController.text;
    String email = _CompanynameController.text;
    String phone = _DiscountController.text;
    String password = _PriceController.text;

    // For demonstration purposes, just print the form data
    print('Name: $name');
    print('Email: $email');
    print('Phone: $phone');
    print('Password: $password');

    // Add your logic to handle the form submission
  }
}

