import 'package:easy_localization/src/public_ext.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:meal/components/drawer/drawer.dart';

import 'package:meal/screens/categories_screen/categories_screen.dart';
import 'package:meal/screens/favorites_screen/favorites_screen.dart';

import 'package:meal/translations/locale_keys.g.dart';

class BottomNavBar extends StatefulWidget {
  static const routeName = 'home';

  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPage = 0;
  late List<Map<String, dynamic>> pages;

  @override
  void initState() {
    pages = [
      {
        'title': LocaleKeys.categories.tr(),
        'page': CategoriesScreen(),
      },
      {
        'title': LocaleKeys.favorites.tr(),
        'page': const FavoritesScreen(),
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            pages[currentPage]['title'],
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        body: pages[currentPage]['page'],
        drawerScrimColor: Colors.black.withOpacity(0.7),
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.82,
          child: const MyDrawer(),
        ),
        bottomNavigationBar: BottomNavigationBar(

          currentIndex: currentPage,
          onTap: (v) {
            setState(() {
              currentPage = v;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.fastfood),
                label: LocaleKeys.categories.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite_border),
                label: LocaleKeys.favorites.tr()),
          ],
        )

        // FancyBottomNavigation(
        //   barBackgroundColor: Theme.of(context).canvasColor,
        //
        //   circleColor: Theme.of(context).primaryColor,
        //   // inactiveIconColor: Colors.white,
        //   textColor: Theme.of(context).primaryColor,
        //   tabs: [
        //     TabData(iconData: Icons.category, title: "Categories"),
        //     TabData(iconData: Icons.favorite_border, title: "Favorites"),
        //   ],
        //   onTabChangedListener: (position) {
        //     setState(() {
        //       currentPage = position;
        //     });
        //   },
        // ),
        );
  }
}
