import 'package:demo_bloc/features/home/domain/entities/product/product_meta_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_meta_model.g.dart';

@JsonSerializable()
class ProductMetaModel extends ProductMetaEntity {
  ProductMetaModel(
      {required super.createdAt,
      required super.updatedAt,
      required super.barcode,
      required super.qrCode});

  factory ProductMetaModel.fromJson(Map<String, dynamic> json) =>
      _$ProductMetaModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductMetaModelToJson(this);
}
