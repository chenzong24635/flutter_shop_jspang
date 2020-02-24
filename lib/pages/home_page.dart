import 'package:flutter/material.dart';
import "package:dio/dio.dart";
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

import '../service/service_method.dart';

//插件
import 'package:dio/dio.dart'; //数据请求
import 'package:flutter_swiper/flutter_swiper.dart'; //轮播图

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var formData = {'lon':'115.02932','lat':'35.76189'};
    request('homePageContext',formData:formData).then((res){
      print(res);
    });
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Text('sffs')
      /* body: FuturBuilder(
        futur: 
      ) */
    );
  }
}

//首页-轮播图
class SwiperWidget extends StatelessWidget {
  final List swiperLists;
  const SwiperWidget({Key key, this.swiperLists}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        itemCount: swiperLists.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network("${swiperLists[index]['images']}");
        },
      ),
    );
  }
}