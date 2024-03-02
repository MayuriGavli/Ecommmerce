import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentDetailsModel {
  String id;
  final String ShippingAddress;
  final String phone;
  final String PaymentMethod;
  final String ProductPrice;

  PaymentDetailsModel({
    this.id = '',
    required this.ShippingAddress,
    required this.phone,
    required this.PaymentMethod,
    required this.ProductPrice,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'ShippingAddress': ShippingAddress,
        'phone': phone,
        'PaymentMethod': PaymentMethod,
        'ProductPrice': ProductPrice,
      };

  static PaymentDetailsModel fromJson(Map<String, dynamic> jsonData) =>
      PaymentDetailsModel(
        ShippingAddress: jsonData['ShippingAddress'],
        phone: jsonData['phone'],
        PaymentMethod: jsonData['PaymentMethod'],
        ProductPrice: jsonData['ProductPrice'],
      );

  factory PaymentDetailsModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> jsonData) {
    final data = jsonData.data()!;
    return PaymentDetailsModel(
      ShippingAddress: data['ShippingAddress'],
      phone: data['phone'],
      PaymentMethod: data['PaymentMethod'],
      ProductPrice: data['ProductPrice'],
    );
  }

  static Future<List<PaymentDetailsModel>> getAllProductDetail() async {
    final productTableObject =
        await FirebaseFirestore.instance.collection('PaymentDetails').get();
    final productData = productTableObject.docs
        .map((QueryDocumentSnapshot<Map<String, dynamic>> e) =>
            PaymentDetailsModel.fromJson(e as Map<String, dynamic>))
        .toList();
    if (productData.length > 0) {
      return productData;
    } else {
      return [];
    }
  }
}
