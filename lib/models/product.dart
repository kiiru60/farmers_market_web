import 'package:flutter/foundation.dart';

class Product {
  final String productName;
  final String unitType;
  final double unitPrice;
  final int availableUnits;
  final String vendorId;
  final String productId;
  final String imageUrl;
  final bool approved;
  final String note;
  final String size;
  List<String> selectedSizes;
  Product(
      {@required this.approved,
      @required this.availableUnits,
      this.imageUrl = "",
      this.note = "",
      this.size,
      @required this.productId,
      @required this.productName,
      @required this.unitPrice,
      @required this.unitType,
      @required this.vendorId});

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'unitType': unitType,
      'unitPrice': unitPrice,
      'availableUnits': availableUnits,
      'approved': approved,
      'imageUrl': imageUrl,
      'size': selectedSizes,
      'note': note,
      'productId': productId,
      'vendorId': vendorId
    };
  }

  Product.fromFirestore(Map<String, dynamic> firestore)
      : productName = firestore['productName'],
        unitType = firestore['unitType'],
        unitPrice = firestore['unitPrice'],
        size = firestore['selectedSizes'],
        availableUnits = firestore['availableUnits'],
        approved = firestore['approved'],
        imageUrl = firestore['imageUrl'],
        note = firestore['note'],
        productId = firestore['productId'],
        vendorId = firestore['vendorId'];
}
