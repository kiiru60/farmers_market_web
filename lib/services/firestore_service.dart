import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_market_web/models/product.dart';
import 'package:farmers_market_web/models/user.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addUser(ApplicationUser user) {
    return _db.collection('users').doc(user.userId).set(user.toMap());
  }

  Future<void> addUserName(ApplicationUser userName) {
    return _db.collection('users').doc(userName.userId).set(userName.toMap());
  }

  Future<ApplicationUser> fetchUser(String userId) {
    return _db
        .collection('users')
        .doc(userId)
        .get()
        .then((snapshot) => ApplicationUser.fromFirestore(snapshot.data()));
  }

  Stream<List<String>> fetchUnitTypes() {
    return _db.collection('types').doc('category').snapshots().map((snapshot) =>
        snapshot
            .data()['production']
            .map<String>((type) => type.toString())
            .toList());
  }

  Future<void> addProduct(Product product) {
    return _db
        .collection('products')
        .doc(product.productId)
        .set(product.toMap());
  }

  Future<void> setProduct(Product product) {
    var options = SetOptions(merge: true);
    return _db
        .collection('products')
        .doc(product.productId)
        .set(product.toMap(), options);
  }

  Future<Product> fetchProduct(String productId) {
    return _db
        .collection('products')
        .doc(productId)
        .get()
        .then((snapshot) => Product.fromFirestore(snapshot.data()));
  }

  Stream<List<Product>> fetchProductsByVendorId(String vendorId) {
    return _db
        .collection('products')
        .where('vendorId', isEqualTo: vendorId)
        .snapshots()
        .map((query) => query.docs)
        .map((snapshot) =>
            snapshot.map((doc) => Product.fromFirestore(doc.data())).toList());
  }

  Stream<List<Product>> fetchProductByCategory(String unitType) {
    return _db
        .collection('products')
        .where('unitType', isEqualTo: unitType)
        .snapshots()
        .map((query) => query.docs)
        .map((snapshot) =>
            snapshot.map((doc) => Product.fromFirestore(doc.data())).toList());
  }

  Stream<List<Product>> fetchAvailableProducts() {
    return _db
        .collection('products')
        .where('availableUnits', isGreaterThan: 0)
        .snapshots()
        .map((query) => query.docs)
        .map((snapshot) =>
            snapshot.map((doc) => Product.fromFirestore(doc.data())).toList());
  }
}
