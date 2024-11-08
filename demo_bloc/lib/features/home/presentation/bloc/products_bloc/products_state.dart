part of 'products_bloc.dart';

final class ProductsState extends Equatable {
  const ProductsState(
      {this.stateStatus = StateStatus.init, this.products = const []});
  final StateStatus stateStatus;
  final List<ProductEntity> products;

  ProductsState copyWith(
      {StateStatus? stateStatus, List<ProductEntity>? products}) {
    return ProductsState(
        stateStatus: stateStatus ?? this.stateStatus,
        products: products ?? this.products);
  }

  @override
  List<Object> get props => [stateStatus, products];
}
