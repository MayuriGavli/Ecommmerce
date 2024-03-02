import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDetailsModel {
  String id;
  final String ProductName;
  final String CompanyName;
  final String Discount;
  final String ProductPrice;
  final imageURL;

  ProductDetailsModel({
    this.id = '',
    required this.ProductName,
    required this.CompanyName,
    required this.Discount,
    required this.ProductPrice,
    required this.imageURL,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'ProductName': ProductName,
        'CompanyName': CompanyName,
        'Discount': Discount,
        'ProductPrice': ProductPrice,
        'imageURL': imageURL,
      };

  static ProductDetailsModel fromJson(Map<String, dynamic> jsonData) =>
      ProductDetailsModel(
        ProductName: jsonData['ProductName'],
        CompanyName: jsonData['CompanyName'],
        Discount: jsonData['Discount'],
        ProductPrice: jsonData['ProductPrice'],
        imageURL: jsonData['imageURL'],
      );

  factory ProductDetailsModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> jsonData) {
    final data = jsonData.data()!;
    return ProductDetailsModel(
      ProductName: data['ProductName'],
      CompanyName: data['CompanyName'],
      Discount: data['Discount'],
      ProductPrice: data['ProductPrice'],
      imageURL: jsonData['imageURL'],
    );
  }

  static Future<List<ProductDetailsModel>> getAllProductDetail() async {
    final productTableObject =
        await FirebaseFirestore.instance.collection('Product').get();
    final productData = productTableObject.docs
        .map((QueryDocumentSnapshot<Map<String, dynamic>> e) =>
            ProductDetailsModel.fromJson(e as Map<String, dynamic>))
        .toList();
    if (productData.length > 0) {
      return productData;
    } else {
      return [];
    }
  }
}
