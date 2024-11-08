// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dimensions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDimensionsModel _$ProductDimensionsModelFromJson(
        Map<String, dynamic> json) =>
    ProductDimensionsModel(
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      depth: (json['depth'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductDimensionsModelToJson(
        ProductDimensionsModel instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'depth': instance.depth,
    };
