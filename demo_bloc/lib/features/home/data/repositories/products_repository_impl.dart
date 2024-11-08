import 'package:demo_bloc/core/app_config/end_points.dart';
import 'package:demo_bloc/features/home/data/models/response/get_products_response_model.dart';
import 'package:demo_bloc/features/home/domain/entities/response/get_products_response_entity.dart';
import 'package:demo_bloc/features/home/domain/repositories/products_repository.dart';
import 'package:demo_bloc/features/shares/domain/repositories/base_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl extends BaseRepository
    implements ProductsRepository {
  ProductsRepositoryImpl({required super.apiService});

  @override
  Future<Response<GetProductsResponseEntity?>> getProducts() async {
    final response = await apiService.getRequest(EndPoints.products);

    try {
      final data = GetProductsResponseModel.fromJson(response.data);
      return createResponse<GetProductsResponseEntity?>(response, data);
    } catch (e) {
      print(e);
      return createResponse<GetProductsResponseEntity?>(response, null);
    }
  }
}
