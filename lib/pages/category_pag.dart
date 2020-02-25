import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import "package:dio/dio.dart";
import 'dart:convert';
import 'dart:async';
import 'dart:io';

import '../service/service_method.dart';

import 'category_pag/leftNav.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List list;

  void _getCategory()async{
    await request('getCategory').then((val){
      list = json.decode(val.toString())['data'];
      print(list);
    });
  }
  @override
  Widget build(BuildContext context) {
    _getCategory();
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Container(
        child: Row(children: <Widget>[
          // LeftNav(list: list),
        ],),
      ),
    );
  }
}