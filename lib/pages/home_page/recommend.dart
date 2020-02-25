import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 适配尺寸

//商品推荐
class Recommend extends StatelessWidget {
  final List recommendList;
  const Recommend({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        _title(),
        _lists(context),
      ],),
    );
  }

  Widget _title() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(8.0),
      child: Text('商品推荐',style:TextStyle(color:Colors.pink)),
    );
  }

  Widget _lists(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (BuildContext context, int index){
          return InkWell(
            onTap: (){
              print('$index');
              // Navigator.of(context).push(MaterialPageRoute(builder: ))
            },
            child: Container(
              width: ScreenUtil().setWidth(280),
              child: Column(children: <Widget>[
                Image.network(
                  recommendList[index]['image'],
                  fit: BoxFit.fill,
                ),
                Text('￥${recommendList[index]['mallPrice']}'),
                Text(
                  '￥${recommendList[index]['price']}',
                  style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough)
                ),
              ],),
            ),
          );
        },
      )
    );
  }
}
