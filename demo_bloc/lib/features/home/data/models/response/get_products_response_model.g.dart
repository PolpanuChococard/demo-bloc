// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductsResponseModel _$GetProductsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetProductsResponseModel(
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      skip: (json['skip'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$GetProductsResponseModelToJson(
        GetProductsResponseModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
      'products': instance.products,
    };
