import 'package:flutter/material.dart';
import 'package:luxe/data/dummy_data.dart';
import 'package:luxe/screens/home/widgets/category_section.dart';
import 'package:luxe/screens/home/widgets/product_list.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          CategorySection(
            title: 'Dress',
            child: ProductList(
              products: dressList,
            ),
          ),
          const SizedBox(height: 10),
          CategorySection(
            title: 'Pashmina',
            child: ProductList(
              products: pashminaList,
            ),
          ),
        ],
      ),
    );
  }
}
