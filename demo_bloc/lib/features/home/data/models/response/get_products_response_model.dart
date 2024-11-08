import 'package:demo_bloc/features/home/data/models/product/product_model.dart';
import 'package:demo_bloc/features/home/domain/entities/response/get_products_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_products_response_model.g.dart';

@JsonSerializable()
class GetProductsResponseModel extends GetProductsResponseEntity {
  @override
  List<ProductModel> get products => super.products as List<ProductModel>;

  GetProductsResponseModel(
      {required List<ProductModel> products,
      required super.total,
      required super.skip,
      required super.limit})
      : super(products: products);

  factory GetProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetProductsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductsResponseModelToJson(this);
}
