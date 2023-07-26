import 'package:flutter/material.dart';
import 'package:news/News/news_search.dart';
import 'package:news/model/Category.dart';
import 'package:news/my_theme.dart';
import 'package:news/settings/settings_tab.dart';
import 'category/category_details_screen.dart';
import 'category/categorywidget.dart';
import 'home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: Image.asset(
            'assets/images/backgound.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                'News App',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(onPressed: () => showSearch(context: context, delegate: NewsSearch()),
                    icon: Icon(Icons.search,size: 32,))
              ],
            ),
            drawer: Drawer(
              child: HomeDrawer(onItemSideMenu: onItemSideMenuClicked),
            ),
            body: selectedItemDrawer == HomeDrawer.setting ?
                SettingTab()
                :
            selectedCategory == null ?
            CategoryWidget(onCategoryItemClicked: onCategoryItemClicked)
                :
            CategoryDetails(category: selectedCategory),

        ),
      ],
    );
  }

  Category? selectedCategory = null;

  void onCategoryItemClicked(Category category) {
    selectedCategory = category;
    setState(() {

    });

  }

  int selectedItemDrawer = HomeDrawer.category;
  void onItemSideMenuClicked(int newSelectedItemDrawer){
    selectedItemDrawer = newSelectedItemDrawer ;
    selectedCategory = null ;
    Navigator.pop(context);
    setState(() {

    });
  }
}
