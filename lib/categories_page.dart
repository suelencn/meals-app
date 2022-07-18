import 'package:flutter/material.dart';

import './dummy_data.dart';
import './category_item.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          //altura = (largura 200)*1.5 =300
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (e) => CategoryItem(e.title, e.color, e.id),
            )
            .toList(),
      ),
    );
  }
}
