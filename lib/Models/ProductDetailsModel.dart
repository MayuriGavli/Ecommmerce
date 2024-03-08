import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDetailsModel {
  String id;
  final String ProductName;
  final String CompanyName;
  final String Discount;
  final String ProductPrice;
  final String imageURL;
  bool isLiked;

  ProductDetailsModel(
      {this.id = '',
      required this.ProductName,
      required this.CompanyName,
      required this.Discount,
      required this.ProductPrice,
      required this.imageURL,
      required this.isLiked

      // this.ProductName = '',
      // this.CompanyName = '',
      // this.Discount = '',
      // this.ProductPrice = '',
      // this.imageURL = '',
      // this.isLiked = false,
      });

  Map<String, dynamic> toJson() => {
        'id': id,
        'ProductName': ProductName,
        'CompanyName': CompanyName,
        'Discount': Discount,
        'ProductPrice': ProductPrice,
        'imageURL': imageURL,
        'isLiked': isLiked
      };

  static ProductDetailsModel fromJson(Map<String, dynamic> jsonData) =>
      ProductDetailsModel(
        id: jsonData['id'],
        ProductName: jsonData['ProductName'],
        CompanyName: jsonData['CompanyName'],
        Discount: jsonData['Discount'],
        ProductPrice: jsonData['ProductPrice'],
        imageURL: jsonData['imageURL'],
        isLiked: jsonData['isLiked'],
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
      isLiked: jsonData['isLiked'],
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
      imageURL: data['imageURL'],
      isLiked: data['isLiked'],
    );
  }

  static Future<List<ProductDetailsModel>> getAllProductDetail(
      {searchProductName = ''}) async {
    var productData = [
      ProductDetailsModel(
          ProductName: '',
          CompanyName: '',
          Discount: '',
          ProductPrice: '',
          imageURL: '',
          isLiked: false)
    ];

    if (searchProductName != '') {
      //For Search List
      final productTableObject = await FirebaseFirestore.instance
          .collection('Product')
          .where('ProductName', isEqualTo: searchProductName)
          .get();
      productData = productTableObject.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> e) =>
              ProductDetailsModel.fromQueryDocumentSnapShot(e))
          .toList();
    } else {
      //For ALl List
      final productTableObject =
          await FirebaseFirestore.instance.collection('Product').get();
      productData = productTableObject.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> e) =>
              ProductDetailsModel.fromQueryDocumentSnapShot(e))
          .toList();
    }

    if (productData.isNotEmpty) {
      return productData;
    } else {
      return [
        ProductDetailsModel(
            ProductName: 'dummy',
            CompanyName: '',
            Discount: '',
            ProductPrice: '',
            imageURL: '',
            isLiked: false)
      ];
    }
  }

  static Future<List<ProductDetailsModel>> getAllFavoriteProduct() async {
    final productTableObject = await FirebaseFirestore.instance
        .collection('Product')
        .where('isLiked', isEqualTo: true)
        .get();
    final productData = productTableObject.docs
        .map((QueryDocumentSnapshot<Map<String, dynamic>> e) =>
            ProductDetailsModel.fromQueryDocumentSnapShot(e))
        .toList();

    if (productData.isNotEmpty) {
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
    imageURL: '',
    isLiked: false);