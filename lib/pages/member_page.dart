import 'package:flutter/material.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('会员中心'),),
      body: Center(
        child: Column(children: <Widget>[
          Text(
            '价格：￥',
          ),
        ],)
      ),
    );
  }
}