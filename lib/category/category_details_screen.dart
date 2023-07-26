import 'package:flutter/material.dart';
import 'package:news/api_manager.dart';
import 'package:news/category/tab_container.dart';
import 'package:news/model/Category.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/my_theme.dart';

class CategoryDetails extends StatelessWidget {
static const String routeName ='category_details';
Category? category ;
CategoryDetails({this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManage.getSources(category?.id ?? ''),
        builder: ((context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(color: MyTheme.primaryColor,),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('something went wrong'),
                ElevatedButton(onPressed: (){}, child: Text('Try again'))
              ],
            );
          }if(snapshot.data?.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data?.message ?? ""),
                ElevatedButton(onPressed: (){}, child: Text('Try again'))
              ],
            );
          }
          var sourcesList = snapshot.data?.sources ?? [];
          return TabContainer(sourceList: sourcesList);
        }
        )
    );
  }
}
