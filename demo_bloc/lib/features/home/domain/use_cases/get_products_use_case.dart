import 'package:demo_bloc/core/use_cases/use_case_base.dart';
import 'package:demo_bloc/features/home/domain/entities/response/get_products_response_entity.dart';
import 'package:demo_bloc/features/home/domain/repositories/products_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase
    implements UseCase<Response<GetProductsResponseEntity?>, void> {
  GetProductsUseCase(this._productsRepository);
  final ProductsRepository _productsRepository;

  @override
  Future<Response<GetProductsResponseEntity?>> call({void params}) {
    return _productsRepository.getProducts();
  }
}
