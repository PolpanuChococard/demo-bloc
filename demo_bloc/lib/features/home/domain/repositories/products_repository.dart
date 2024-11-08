import 'package:demo_bloc/features/home/domain/entities/response/get_products_response_entity.dart';
import 'package:dio/dio.dart';

abstract class ProductsRepository {
  Future<Response<GetProductsResponseEntity?>> getProducts();
}
