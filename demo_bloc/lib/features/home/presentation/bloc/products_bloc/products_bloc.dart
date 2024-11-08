import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_bloc/core/enums/state_status.dart';
import 'package:demo_bloc/core/extensions/response_extension.dart';
import 'package:demo_bloc/features/home/domain/entities/product/product_entity.dart';
import 'package:demo_bloc/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'products_event.dart';
part 'products_state.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUseCase getProductsUseCase;
  ProductsBloc({required this.getProductsUseCase}) : super(const ProductsState()) {
    on<InitialEvent>(_onInitial);
  }

  FutureOr<void> _onInitial(
      InitialEvent event, Emitter<ProductsState> emit) async {
    final res = await getProductsUseCase.call();

    if (res.isSuccessWithData) {
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(
          products: res.data!.products, stateStatus: StateStatus.done));
    } else {
      //TODO handle fetch failed
    }
  }
}
