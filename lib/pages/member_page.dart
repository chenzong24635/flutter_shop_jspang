import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count.dart';


class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<Counter>(context);
    final _price = Provider.of<Price>(context);

    return Scaffold(
      appBar: AppBar(title: Text('会员中心'),),
      floatingActionButton: FloatingActionButton(
        onPressed: _counter.reduce,
        child: Icon(Icons.linear_scale),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Text(
            '价格：￥${_price.getPrice}',
          ),
          RaisedButton(
            onPressed: _price.increment, 
            child: Text('涨价')
          ),
          SizedBox(height: 20.0,),
          Text(
            'Count: ${_counter.count}',style: TextStyle(fontSize: 30.0),
          )
          
        ],)
      ),
      
    );
  }
}