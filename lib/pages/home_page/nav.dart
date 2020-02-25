import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 适配尺寸

//首页头部导航
class TopNavigator extends StatelessWidget {
  final List navigatorList ;
  const TopNavigator({Key key,this.navigatorList }) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, item){
    return InkWell(
      child: Column(children: <Widget>[
        Image.network(item['image'], width: ScreenUtil().setWidth(95)),
        Text(item['mallCategoryName'])
      ],)
    );
  }
  @override
  Widget build(BuildContext context) {
    if(navigatorList.length > 10){
      navigatorList.removeRange(10, navigatorList.length);
    }

    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.fromLTRB(3.0,10.0,3.0,10.0),
      child: GridView.count(
        crossAxisCount: 5,
        physics: NeverScrollableScrollPhysics(),//禁止滚动
        children: navigatorList.map((item){
          return _gridViewItemUI(context, item);
        }).toList(),
      )
    );
  }
}