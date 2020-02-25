import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftNav extends StatelessWidget {
  final List list;
  const LeftNav({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(list);
    List leftNav = list.map<dynamic>((item){
        return item['mallCategoryName'];
      }).toList();
    return Container(
      child: ListView.builder(
        itemCount: leftNav.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: ScreenUtil().setWidth(180),
            child: InkWell(
              onTap: (){},
              child: Text(leftNav[index]),
            )
          );
        }
      ),
    );
  }
}