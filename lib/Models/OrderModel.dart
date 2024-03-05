import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String id;
  final String userId;
  final String userName;
  final String userShippingAddress;

  // final String userPaymentMethod;
  final String productName;
  final String productShippingDate;

  OrderModel({
    this.id = '',
    required this.userId,
    required this.userName,
    required this.userShippingAddress,
    required this.productName,
    required this.productShippingDate,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'userName': userName,
        'userShippingAddress': userShippingAddress,
        'productName': productName,
        'productShippingDate': productShippingDate,
      };

  static OrderModel fromJson(Map<String, dynamic> jsonData) => OrderModel(
        id: jsonData['id'],
        userId: jsonData['userId'],
        userName: jsonData['userName'],
        userShippingAddress: jsonData['userShippingAddress'],
        productName: jsonData['productName'],
        productShippingDate: jsonData['productShippingDate'],
      );

  factory OrderModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> jsonData) {
    final data = jsonData.data()!;
    return OrderModel(
        id: data['id'],
        userId: data['userId'],
        userName: data['userName'],
        userShippingAddress: data['userShippingAddress'],
        productName: data['productName'],
        productShippingDate: data['productShippingDate']);
  }

  factory OrderModel.fromQueryDocumentSnapShot(
      QueryDocumentSnapshot<Map<String, dynamic>> jsonData) {
    final data = jsonData.data()!;
    return OrderModel(
        id: data['id'],
        userId: data['userId'],
        userName: data['userName'],
        userShippingAddress: data['userShippingAddress'],
        productName: data['productName'],
        productShippingDate: data['productShippingDate']);
  }

  static Future<List<OrderModel>> getAllOrderDetail() async {
    final orderTableObject =
        await FirebaseFirestore.instance.collection('Orders').get();
    final orderData = orderTableObject.docs
        .map((QueryDocumentSnapshot<Map<String, dynamic>> e) =>
            OrderModel.fromQueryDocumentSnapShot(e))
        .toList();
    if (orderData.length > 0) {
      return orderData;
    } else {
      return [];
    }
  }

  static Future<void> addOrderDetail(OrderModel orderData) async {
    final orderTableObject =
        await FirebaseFirestore.instance.collection('Orders').doc();
    orderData.id = orderTableObject.id;
    final jsonData = orderData.toJson(); // Converted the userdata into json
    await orderTableObject.set(jsonData);
  }
}
