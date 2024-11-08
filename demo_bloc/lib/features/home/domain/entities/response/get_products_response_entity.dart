import 'package:demo_bloc/features/home/domain/entities/product/product_entity.dart';

class GetProductsResponseEntity {
  final List<ProductEntity> products;
  final int total;
  final int skip;
  final int limit;

  GetProductsResponseEntity({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });
}
