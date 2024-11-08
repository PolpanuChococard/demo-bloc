import 'package:demo_bloc/features/home/domain/entities/product/product_dimensions_entity.dart';
import 'package:demo_bloc/features/home/domain/entities/product/product_meta_entity.dart';
import 'package:demo_bloc/features/home/domain/entities/product/product_review_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductEntity {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final double weight;
  final ProductDimensionsEntity dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<ProductReviewEntity> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final ProductMetaEntity meta;
  final String thumbnail;
  final List<String> images;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.thumbnail,
    required this.images,
  });

  factory ProductEntity.getBoneMock() {
    return ProductEntity(
        id: -1,
        title: BoneMock.name,
        description: BoneMock.paragraph,
        category: '',
        price: 0,
        discountPercentage: 0,
        rating: 0,
        stock: 0,
        tags: [],
        brand: '',
        sku: '',
        weight: 0,
        dimensions: ProductDimensionsEntity(width: 0, height: 0, depth: 0),
        warrantyInformation: '',
        shippingInformation: '',
        availabilityStatus: '',
        reviews: [],
        returnPolicy: '',
        minimumOrderQuantity: 0,
        meta: ProductMetaEntity(
            createdAt: DateTime(0),
            updatedAt: DateTime(0),
            barcode: '',
            qrCode: ''),
        thumbnail: '',
        images: []);
  }
}
