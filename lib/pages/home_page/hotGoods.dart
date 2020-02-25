import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 适配尺寸

//火爆专区
class HotGoods extends StatefulWidget {
  final int page;
  final List<Map> hotGoodsList; 
  HotGoods({Key key,this.page, this.hotGoodsList}) : super(key: key);

  @override
  _HotGoodsState createState() => _HotGoodsState();
}

class _HotGoodsState extends State<HotGoods> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //  child: child,
    );
  }

  
}