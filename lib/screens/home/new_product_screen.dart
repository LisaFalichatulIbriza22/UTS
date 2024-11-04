import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:luxe/data/dummy_data.dart';
import 'package:luxe/data/product.dart';
import 'package:luxe/utils/app_colors.dart';
import 'package:luxe/utils/format_rupiah.dart';

class NewProductScreen extends StatelessWidget {
  NewProductScreen({super.key});

  final List<Product> products = [...pashminaList, ...dressList];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 16),
          RichText(
            text: const TextSpan(
              text: 'PRODUK ',
              style: TextStyle(color: Colors.black, fontSize: 20),
              children: [
                TextSpan(
                  text: 'TERBARU',
                  style: TextStyle(
                      color: AppColors.primary, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            itemCount: products.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 9 / 12,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
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
              );
            },
          ),
        ],
      ),
    );
  }
}
