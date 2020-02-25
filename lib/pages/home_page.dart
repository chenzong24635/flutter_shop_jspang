import 'package:flutter/material.dart';
import "package:dio/dio.dart";
import 'dart:convert';
import 'dart:async';
import 'dart:io';

import '../service/service_method.dart';

//插件
// import 'package:dio/dio.dart'; //数据请求
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 适配尺寸
import 'package:flutter_easyrefresh/easy_refresh.dart'; //上拉加载，
import 'package:flutter_easyrefresh/material_footer.dart';

//Widget
import 'home_page/swiper.dart';
import 'home_page/nav.dart';
import 'home_page/adBannder.dart';
import 'home_page/call.dart';
import 'home_page/recommend.dart';
import 'home_page/floorTitle.dart';
import 'home_page/floorContext.dart';
import 'home_page/hotGoods.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  int page = 1;
  List<Map> hotGoodsList = [];

  @override 
  bool get wantKeepAlive => true;

  @override 
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),
      body: FutureBuilder(
        future: request('homePageContext', formData: formData),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = json.decode(snapshot.data.toString())['data'];
            List<Map> swiperDataList =(data['slides'] as List).cast(); // 轮播图
            List<Map> navigatorList =(data['category'] as List).cast(); // 导航组件
            String adBannerImg = data['advertesPicture']['PICTURE_ADDRESS']; // 广告图
            String callImg = data['shopInfo']['leaderImage']; //店长图片
            String callPhone = data['shopInfo']['leaderPhone']; //店长电话
            List recommendList = (data['recommend'] as List).cast(); // 商品推荐
            String floorTitle1 = data['floor1Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
            String floorTitle2 = data['floor2Pic']['PICTURE_ADDRESS']; //楼层2的标题图片
            String floorTitle3 = data['floor3Pic']['PICTURE_ADDRESS']; //楼层3的标题图片
            List<Map> floorList1 = (data['floor1'] as List).cast(); //楼层1商品和图片
            List<Map> floorList2 = (data['floor2'] as List).cast(); //楼层2商品和图片
            List<Map> floorList3 = (data['floor3'] as List).cast(); //楼层3商品和图片

            return EasyRefresh(
              // footer: MaterialFooter(),
              child: ListView(
                children: <Widget>[
                  SwiperWidget(swiperDataList: swiperDataList), // 轮播图
                  TopNavigator(navigatorList: navigatorList),  // 导航组件
                  AdBanner(adBannerImg: adBannerImg),  // 广告图
                  Call(callImg: callImg, callPhone: callPhone),
                  Recommend(recommendList:recommendList),
                  FloorTitle(floorTitle: floorTitle1),
                  FloorContext(floorList: floorList1),
                  FloorTitle(floorTitle: floorTitle2),
                  FloorContext(floorList: floorList2),
                  FloorTitle(floorTitle: floorTitle3),
                  FloorContext(floorList: floorList3),
                  _hotGoods(),
                ],
              ),
              onRefresh: () async{
              },
              onLoad: () async {
                _getHotGoods();
              },
            );
          } else {
            return Center(
              child: Text('加载中'),
            );
          }
        },
      ),
    );
  }

  //火爆商品接口
  void _getHotGoods() {
    var formPage = {'page': page};
    request('homePageBelowConten', formData: formPage).then((val) {
      var data = json.decode(val.toString());
      List<Map> newGoodsList = (data['data'] as List).cast();
      setState(() {
        hotGoodsList.addAll(newGoodsList);
        page++;
      });
    });
  }

  //火爆专区标题
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.all(5.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
    child: Text('火爆专区'),
  );

  //火爆专区子项
  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      List<dynamic> listWidget = hotGoodsList.map((val) {
        return InkWell(
            onTap: () {
              
            },
            child: Container(
              width: ScreenUtil().setWidth(372),
              color: Colors.white,
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(bottom: 3.0),
              child: Column(
                children: <Widget>[
                  Image.network(
                    val['image'],
                    width: ScreenUtil().setWidth(375),
                  ),
                  Text(
                    val['name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                  ),
                  Row(
                    children: <Widget>[
                      Text('￥${val['mallPrice']}'),
                      Text(
                        '￥${val['price']}',
                        style: TextStyle(
                            color: Colors.black26,
                            decoration: TextDecoration.lineThrough),
                      )
                    ],
                  )
                ],
              ),
            ));
      }).toList();

      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text(' ');
    }
  }

  //火爆专区组合
  Widget _hotGoods() {
    return Container(
        child: Column(
      children: <Widget>[
        hotTitle,
        _wrapList(),
      ],
    ));
  }

}

