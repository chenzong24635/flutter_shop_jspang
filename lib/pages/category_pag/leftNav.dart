import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';


import '../../model/category.dart';
import '../../service/service_method.dart';

//左侧导航菜单
class LeftCategoryNav extends StatefulWidget {
  final List list;
  const LeftCategoryNav({Key key, this.list}) : super(key: key);
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List list = [];

  @override
  void initState() {
    _getCategory();
    list = widget.list; //在initSatte中 widget.list 获取
    // list.addAll(['adadad']);
    print(list);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var len = list.length != null ? list.length : 0;
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: Colors.black12))
      ),
      child: ListView.builder(
        itemCount: len,
        itemBuilder: (context, index) {
          return _item(index);
        }
      ),
    );
  }

void _getCategory()async{
  await request('getCategory').then((val){
    var data = json.decode(val.toString());
    CategoryModel category= CategoryModel.fromJson(data);

    setState(() {
      list =category.data;
    });
  });
}

  Widget _item(int index) {
    return InkWell(
      onTap: (){},
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(0.0,20.0,0.0,20.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12)),
        ),
        child: Text(
          list[index].mallCategoryName
        ),
      )
    );
  }
}

