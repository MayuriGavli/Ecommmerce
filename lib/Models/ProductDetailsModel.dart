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
        id: jsonData['id'],
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
      id: data['id'],
      ProductName: data['ProductName'],
      CompanyName: data['CompanyName'],
      Discount: data['Discount'],
      ProductPrice: data['ProductPrice'],
      imageURL: jsonData['imageURL'],
    );
  }

  factory ProductDetailsModel.fromQueryDocumentSnapShot(
      QueryDocumentSnapshot<Map<String, dynamic>> jsonData) {
    final data = jsonData.data()!;
    return ProductDetailsModel(
      id: data['id'],
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
            ProductDetailsModel.fromQueryDocumentSnapShot(e))
        .toList();
    if (productData.length > 0) {
      return productData;
    } else {
      return [];
    }
  }

  static Future<void> updateProductRecord(
      ProductDetailsModel editedProductData) async {
    final productTableObject = await FirebaseFirestore.instance
        .collection('Product')
        .doc(editedProductData.id)
        .update(editedProductData.toJson());
  }

  static Future<void> deleteProductRecord(
      ProductDetailsModel editedProductData) async {
    final productTableObject = await FirebaseFirestore.instance
        .collection('Product')
        .doc(editedProductData.id)
        .delete();
  }
}

final ProductDetailsModelInstance = ProductDetailsModel(
    ProductName: '',
    CompanyName: '',
    Discount: '',
    ProductPrice: '',
    imageURL: '');