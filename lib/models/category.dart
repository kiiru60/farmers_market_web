import 'package:equatable/equatable.dart';
import 'package:farmers_market_web/models/entities/product_category_entity.dart';
import 'package:farmers_market_web/models/entity.dart';

class ProductCategory extends Equatable {
  final int id;
  final int parentId;
  final String name;
  final String description;
  final bool isCategoryContainer;

  ProductCategory(
    this.id, {
    int parentId,
    this.name,
    this.description,
    bool isCategoryContainer,
  })  : parentId = parentId ?? 0,
        isCategoryContainer = isCategoryContainer ?? false;

  @override
  List<Object> get props => [id, parentId, name];

  @override
  bool get stringify => true;

  @override
  factory ProductCategory.fromEntity(Entity entity) {
    if (entity is ProductCategoryEntity) {
      return ProductCategory(
        entity.id,
        parentId: entity.parentId,
        name: entity.title,
        description: entity.description,
      );
    } else {
      return null;
    }
  }
}
