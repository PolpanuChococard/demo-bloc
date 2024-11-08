import 'package:demo_bloc/features/home/domain/entities/product/product_dimensions_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_dimensions_model.g.dart';

@JsonSerializable()
class ProductDimensionsModel extends ProductDimensionsEntity {
  ProductDimensionsModel(
      {required super.width, required super.height, required super.depth});

  factory ProductDimensionsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDimensionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDimensionsModelToJson(this);
}
