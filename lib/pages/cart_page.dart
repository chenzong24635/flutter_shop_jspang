import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count.dart';


class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<Counter>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _counter.increment,
        child: Icon(Icons.add),
      ),
      body:Center(
        child: Text('getCategory:${_counter.count}',style: TextStyle(fontSize: 30.0),),
      )
    );
  }
}