// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductMetaModel _$ProductMetaModelFromJson(Map<String, dynamic> json) =>
    ProductMetaModel(
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      barcode: json['barcode'] as String,
      qrCode: json['qrCode'] as String,
    );

Map<String, dynamic> _$ProductMetaModelToJson(ProductMetaModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'barcode': instance.barcode,
      'qrCode': instance.qrCode,
    };
