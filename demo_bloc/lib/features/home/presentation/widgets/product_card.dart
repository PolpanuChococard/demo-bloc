import 'package:demo_bloc/core/app_config/app_style.dart';
import 'package:demo_bloc/core/extensions/context_extension.dart';
import 'package:demo_bloc/features/home/domain/entities/product/product_entity.dart';
import 'package:demo_bloc/features/shares/presentation/widgets/demo_button.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: AppStyle.appBoxShadows,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              width: 2,
              color: context.theme.colorScheme.primary.withOpacity(0.5))),
      padding: EdgeInsets.all(AppStyle.seperator),
      margin: EdgeInsets.all(AppStyle.seperator).copyWith(top: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: _ProductImage(url: product.thumbnail)),
          Expanded(flex: 4, child: _ProductInfo(product: product)),
        ],
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              boxShadow: AppStyle.appBoxShadows,
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  width: 2,
                  color: context.theme.colorScheme.primary.withOpacity(0.5))),
          child: (url.isEmpty)
              ? Image.asset('assets/images/mock-image.png')
              : Image.network(url)),
    );
  }
}

class _ProductInfo extends StatelessWidget {
  const _ProductInfo({required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            maxLines: 1,
            text: TextSpan(
              text: 'Product : ',
              style: context.textTheme.titleSmall,
              children: [
                TextSpan(
                    text: '${product.title}',
                    style: context.textTheme.bodySmall),
              ],
            ),
          ),
          Divider(),
          Text(
            product.description,
            style: context.textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
