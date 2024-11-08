import 'package:demo_bloc/features/home/domain/entities/product/product_review_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_review_model.g.dart';

@JsonSerializable()
class ProductReviewModel extends ProductReviewEntity {
  ProductReviewModel(
      {required super.rating,
      required super.comment,
      required super.date,
      required super.reviewerName,
      required super.reviewerEmail});

  factory ProductReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductReviewModelToJson(this);
}
