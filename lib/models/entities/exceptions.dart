import 'package:flutter/material.dart';

//Exception that is thrown when http request call response is not 200
class HttpRequestException implements Exception {}

//Exception that is thrown when value is not presented in Local Db
class LocalDbExceptionimplements implements Exception {}

//Exception that is thrown when Entity to Model conversion is performed
class EntityModelMapperException implements Exception {
  final String message;

  EntityModelMapperException({@required this.message});
}

class RemoteServerException implements Exception {}

class LocalDatabaseException implements Exception {}

class SubCategories {
  static final homeItems = [
    "Floor and Rugs",
    "Kitchen and Dining",
    "Bedroom Items",
    "Outdoor Home Decors",
    "Organization and Storage",
    "Traditional Furniture",
    "Home Improvement"
        "Office Items"
        "Food and Drink"
        "Spititual and Religion"
  ];
  var artItems = [
    "Paintings",
    "Digital Prints",
    "Engraved Prints",
    "Giclee Prints",
    "Event Prints",
    "Memorabilia",
    "Hand Drawings"
        "Souveniers"
        "Glass Art"
        "Sculpture Art"
        "Dolls and Miniatures"
  ];
}
