import 'package:flutter/material.dart';
import 'package:news/category/category_item_widget.dart';
import 'package:news/model/Category.dart';

class CategoryWidget extends StatelessWidget {
  var categoryList = Category.getCategory();
  Function onCategoryItemClicked;
  CategoryWidget({required this.onCategoryItemClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Pick your category \n of interest',
          style:  TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
          ),
          SizedBox(height: 12,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 18,
                ),
                itemCount: categoryList.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      onCategoryItemClicked(categoryList[index]);
                    },
                      child: CategoryItemWidget(category: categoryList[index], index:index));
                }),
          ),
        ],
      ),
    );
  }
}
