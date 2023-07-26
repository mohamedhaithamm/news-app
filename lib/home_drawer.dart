import 'package:flutter/material.dart';
import 'package:news/my_theme.dart';

class HomeDrawer extends StatelessWidget {
  static const  int category = 1;
  static const  int setting = 2;

  Function onItemSideMenu ;
  HomeDrawer({required this.onItemSideMenu});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: MyTheme.primaryColor,
          padding: EdgeInsets.all(30),
          width: double.infinity,
          child: Text('News App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: MyTheme.whiteColor
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              onItemSideMenu(category);
            },
            child: Row(
              children: [
                Icon(Icons.menu , size: 35,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Categories',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              onItemSideMenu(setting);
            },
            child: Row(
              children: [
                Icon(Icons.settings , size: 35,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Settings',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
