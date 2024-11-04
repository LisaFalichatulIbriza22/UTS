import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:luxe/data/product.dart';
import 'package:luxe/utils/app_colors.dart';
import 'package:luxe/utils/format_rupiah.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            width: 190,
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              color: Colors.white,
              clipBehavior: Clip.antiAlias,
              elevation: 0.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: product.image!,
                    fit: BoxFit.cover,
                    height: 120,
                    width: double.infinity,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name!,
                          style: const TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          formatRupiah(product.price!),
                          style: const TextStyle(color: AppColors.primary),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.city!,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
