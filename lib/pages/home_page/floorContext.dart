import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 适配尺寸

//楼层商品内容
class FloorContext extends StatelessWidget {
  final List floorList;

  const FloorContext({
    Key key, 
    this.floorList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: <Widget>[
        Column(
          children: <Widget>[
            _item(floorList[0]),
            _item(floorList[3]),
          ],
        ),
        Column(
          children: <Widget>[
            _item(floorList[1]),
            _item(floorList[2]),
            _item(floorList[4]),
          ],
        ),
      ],),
    );
  }
}

Widget _item(goods) {
  return Container(
    width: ScreenUtil().setWidth(375),
    child: InkWell(
      onTap:(){
        print(goods);
      },
      child: Image.network(goods['image'])
    )
  );
}