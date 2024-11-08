import 'package:demo_bloc/core/enums/state_status.dart';
import 'package:demo_bloc/core/resouces/services_locator/services_locator.dart';
import 'package:demo_bloc/features/home/domain/entities/product/product_entity.dart';
import 'package:demo_bloc/features/home/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:demo_bloc/features/home/presentation/widgets/product_card.dart';
import 'package:demo_bloc/features/shares/presentation/widgets/demo_app_bar.dart';
import 'package:demo_bloc/features/shares/presentation/widgets/demo_body_shell.dart';
import 'package:demo_bloc/features/shares/presentation/widgets/demo_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  ProductsBloc get providedBloc =>
      getIt.get<ProductsBloc>()..add(InitialEvent());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => providedBloc,
      child: PopScope(
        canPop: false,
        child: Scaffold(
            drawer: const DemoDrawer(),
            appBar: const DemoAppBar(title: Text('Home')),
            body: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                return Skeletonizer(
                    enabled: !state.stateStatus.isDone,
                    child: DemoBodyShell(childs: [
                      (state.stateStatus.isDone)
                          ? _buildProducts()
                          : _buildProductsSkeleton()
                    ]));
              },
            )),
      ),
    );
  }

  Widget _buildProducts() {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.products.length,
          itemBuilder: (context, index) =>
              ProductCard(product: state.products[index]),
        );
      },
    );
  }

  Widget _buildProductsSkeleton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
            7, (_) => ProductCard(product: ProductEntity.getBoneMock()))
      ],
    );
  }
}
