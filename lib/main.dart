import 'package:flutter/material.dart';
import 'package:meals_app/pages/filters_page.dart';

import 'pages/tabs_page.dart';
import 'pages/categoryMeals_page.dart';
import 'pages/categories_page.dart';
import 'pages/mealDetail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        //fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (context) => TabsPage(),
        CategoryMealsPage.routeName: ((context) => CategoryMealsPage()),
        MealDetailPage.routeName: ((context) => MealDetailPage()),
        FilterPage.routeName: ((context) => FilterPage()),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryMealsPage());
      },
    );
  }
}
