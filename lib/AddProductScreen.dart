import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  AddProductScreenState createState() => AddProductScreenState();
}

class AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _ProductnameController = TextEditingController();
  final _CompanynameController = TextEditingController();
  final _TagController = TextEditingController();
  final _PriceController = TextEditingController();

  bool _passwordVisible = false;
  bool _agreedToTerms = false;

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
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet()));
                        },
                        child: Text("Upload Image")),

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
                          if (_formKey.currentState!.validate()) {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => HomePage()),
                            // );
                            // Fluttertoast.showToast(
                            //     msg: "This is Center Short Toast",
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.CENTER,
                            //     timeInSecForIosWeb: 1,
                            //     backgroundColor: Colors.red,
                            //     textColor: Colors.white,
                            //     fontSize: 16.0
                            // );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Product Added Successfully"),
                            ));
                            _submitForm();
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

  Widget bottomSheet() {
    return Container(
      height: 100.0,
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
                onPressed: () {},
                icon: Icon(Iconsax.gallery),
                label: Text("Gallery")),
          ],
        )
      ]),
    );
  }

  void _submitForm() {
    // Perform the form submission logic here
    String name = _ProductnameController.text;
    String email = _CompanynameController.text;
    String phone = _TagController.text;
    String password = _PriceController.text;

    // For demonstration purposes, just print the form data
    print('Name: $name');
    print('Email: $email');
    print('Phone: $phone');
    print('Password: $password');

    // Add your logic to handle the form submission
  }
}
