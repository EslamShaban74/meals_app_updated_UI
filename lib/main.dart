import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meal/providers/meal_provider/meal_provider.dart';
import 'package:meal/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:meal/screens/filters_screen/filters_screen.dart';
import 'package:meal/screens/meals_details_screen/meals_details_screen.dart';
import 'package:meal/screens/meals_screen/meals_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MealProvider>(
      create: (context) => MealProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal',
      theme: ThemeData(
        canvasColor: HexColor('#E1E1E1'),
        primaryColor: HexColor('#444444'),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: HexColor('#212121'),
        ),
        scaffoldBackgroundColor: HexColor('#212121'),
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            headline3: TextStyle(
                fontSize: 20.0,
                color: HexColor('#E1E1E1'),
                fontFamily: 'RobotoCondensed'),
            headline5: const TextStyle(
              color: Colors.white,
              fontFamily: 'RobotoCondensed',
              fontSize: 18.0,
            ),
            headline6: const TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontFamily: 'RobotoCondensed',
            ),
            caption: const TextStyle(color: Colors.white)),
      ),
      routes: {
        '/': (context) => const BottomNavBar(),
        MealsScreen.routeName: (context) => MealsScreen(),
        MealsDetailsScreen.routeName: (context) => MealsDetailsScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Meals',
//           style: TextStyle(
//               fontFamily: 'Raleway',
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold),
//         ),
//
//       ),
//       body: CategoriesScreen(),
//     );
//   }
// }
