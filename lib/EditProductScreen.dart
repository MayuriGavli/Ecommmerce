import 'dart:io';

import 'package:e_commmerce1/Models/ProductDetailsModel.dart';
import 'package:e_commmerce1/Singleton/AppSingleton.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  EditProductScreenState createState() => EditProductScreenState();
}

class EditProductScreenState extends State<EditProductScreen> {
  File? _selectedImage;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _ProductnameController = TextEditingController();
  final _CompanynameController = TextEditingController();
  final _TagController = TextEditingController();
  final _PriceController = TextEditingController();

  bool _passwordVisible = false;
  bool _agreedToTerms = false;

  @override
  void initState() {
    super.initState();
    _ProductnameController.text =
        appSingletonInstance.productDetailToEdit.ProductName;
    _CompanynameController.text =
        appSingletonInstance.productDetailToEdit.CompanyName;
    _TagController.text = appSingletonInstance.productDetailToEdit.Discount;
    _PriceController.text =
        appSingletonInstance.productDetailToEdit.ProductPrice;
    _selectedImage =
        File(appSingletonInstance.productDetailToEdit.imageURL.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: const Text("Edit Product"),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
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
                      controller: _TagController,
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
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
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
                                          Image.asset('images/logo/pro.png')
                                              .image,
                                    )
                            ],
                          ),

                          // SizedBox(
                          //   width: 120,
                          //   height: 120,
                          //   child: ClipRRect(
                          //       borderRadius: BorderRadius.circular(300),
                          //       child: Image(
                          //         image: AssetImage("images/logo/pro.png"),
                          //       )),
                          // ),
                          // // _selectedImage != null ? Image.file(_selectedImage!) : const Text("Please Select an Image"),
                          // _selectedImage != null ? CircleAvatar(
                          //     radius: 56,
                          //     backgroundImage: Image.file(
                          //       File(_selectedImage),).image)
                          //     : const Text("Please Select an Image"),

                          const SizedBox(height: 10.0),
                          TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: ((builder) => bottomSheet()));
                              },
                              child: Text("Change Profile Picture"))
                        ],
                      ),
                    ),
                    // TextButton(
                    //     onPressed: () {
                    //       showModalBottomSheet(
                    //           context: context,
                    //           builder: ((builder) => bottomSheet()));
                    //     },
                    //     child: Text("Upload Image")),

                    // //Image
                    // TextFormField(
                    //   controller: _nameController,
                    //   decoration: const InputDecoration(
                    //       prefixIcon: Icon(Icons.person),
                    //       border: OutlineInputBorder(),
                    //       labelText: "Price"),
                    //   validator: (name) {
                    //     if (name!.isEmpty) {
                    //       return 'Enter Valid Price';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // const SizedBox(height: 16.0),

                    const SizedBox(height: 16.0),

                    //create new account
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Check if the form is valid and terms are agreed
                          // if (_formKey.currentState!.validate()) {
                          //   // Navigator.push(
                          //   //   context,
                          //   //   MaterialPageRoute(
                          //   //       builder: (context) => HomePage()),
                          //   // );
                          //   // Fluttertoast.showToast(
                          //   //     msg: "This is Center Short Toast",
                          //   //     toastLength: Toast.LENGTH_SHORT,
                          //   //     gravity: ToastGravity.CENTER,
                          //   //     timeInSecForIosWeb: 1,
                          //   //     backgroundColor: Colors.red,
                          //   //     textColor: Colors.white,
                          //   //     fontSize: 16.0
                          //   // );
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(const SnackBar(
                          //     content: Text("Product Added Successfully"),
                          //   ));
                          //   _submitForm();
                          // }
                          _submitForm();
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

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(returnedImage!.path);
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
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Iconsax.camera),
                label: Text("Camera")),
            TextButton.icon(
                onPressed: () {
                  _pickImageFromGallery();
                },
                icon: Icon(Iconsax.gallery),
                label: Text("Gallery")),
          ],
        ),
        // _selectedImage != null ? Image.file(_selectedImage!) : const Text("Please Select an Image")
      ]),
    );
  }

  void _submitForm() async {
    // Perform the form submission logic here
    //Image Triiming Process
    var imageTrimedFromFirst =
        _selectedImage.toString().substring(7); //Trim Image From first
    var finalImageAfterTrimFromBack = imageTrimedFromFirst.substring(
        0, imageTrimedFromFirst.length - 1); //Trim Image from Back

    String productId = appSingletonInstance.productDetailToEdit.id;
    String productName = _ProductnameController.text;
    String companyName = _CompanynameController.text;
    String productDiscount = _TagController.text;
    String productPrice = _PriceController.text;
    String productImage = finalImageAfterTrimFromBack;

    print('**********************');
    print('Image Url Before Trimming = $_selectedImage');
    print('Image Url After Trimming = $finalImageAfterTrimFromBack');
    print('**********************');

    // For demonstration purposes, just print the form data
    print('**********************');
    print('productId: $productId');
    print('productName: $productName');
    print('companyName: $companyName');
    print('productDiscount: $productDiscount');
    print('productPrice: $productPrice');
    print('productImage: $productImage');
    print('**********************');

    var editedProductData = ProductDetailsModel(
        id: productId,
        ProductName: productName,
        CompanyName: companyName,
        Discount: productDiscount,
        ProductPrice: productPrice,
        imageURL: productImage);

    await ProductDetailsModel.updateProductRecord(editedProductData);

    Fluttertoast.showToast(
        msg: "Product Update Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.pop(context);
  }
}
