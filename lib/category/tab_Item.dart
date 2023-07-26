import 'package:flutter/material.dart';
import 'package:news/my_theme.dart';

import '../model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  Source source ;
  bool isSelected;
  TabItem({required this.source , required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? MyTheme.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(22),
        border:Border.all( color: MyTheme.primaryColor)
      ),
      child: Text(source.name ?? '',
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: isSelected ? MyTheme.whiteColor : MyTheme.primaryColor
      ),
      ),
    );
  }
}
