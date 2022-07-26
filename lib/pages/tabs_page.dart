import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './favorites_page.dart';
import './categories_page.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsPage(this.favoriteMeals);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: 'Favorites',
              )
            ],
          ),
        ),
        drawer: MainDrawer(),
        body: TabBarView(
          children: [
            CategoriesPage(),
            FavoritesPage(widget.favoriteMeals),
          ],
        ),
      ),
    );
  }
}
