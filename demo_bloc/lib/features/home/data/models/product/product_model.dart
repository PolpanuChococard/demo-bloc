import 'package:demo_bloc/features/home/data/models/product/product_dimensions_model.dart';
import 'package:demo_bloc/features/home/data/models/product/product_meta_model.dart';
import 'package:demo_bloc/features/home/data/models/product/product_review_model.dart';
import 'package:demo_bloc/features/home/domain/entities/product/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(includeIfNull: false)
class ProductModel extends ProductEntity {
  @override
  ProductDimensionsModel get dimensions =>
      super.dimensions as ProductDimensionsModel;

  @override
  List<ProductReviewModel> get reviews =>
      super.reviews as List<ProductReviewModel>;

  @override
  ProductMetaModel get meta => super.meta as ProductMetaModel;

  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.price,
    required super.discountPercentage,
    required super.rating,
    required super.stock,
    required super.tags,
    required String? brand,
    required super.sku,
    required super.weight,
    required ProductDimensionsModel dimensions,
    required super.warrantyInformation,
    required super.shippingInformation,
    required super.availabilityStatus,
    required List<ProductReviewModel> reviews,
    required super.returnPolicy,
    required super.minimumOrderQuantity,
    required ProductMetaModel meta,
    required super.thumbnail,
    required super.images,
  }) : super(
            brand: brand ?? '',
            dimensions: dimensions,
            reviews: reviews,
            meta: meta);

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
