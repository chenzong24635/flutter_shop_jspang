import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/index_page.dart';

import './provider/count.dart';

void main() {
  final counter = Counter();
  final price = Price();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: counter),
        ChangeNotifierProvider.value(value: price),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title:'百姓生活',
        debugShowCheckedModeBanner: false,
        theme:ThemeData(
          primaryColor: Colors.pink,
        ),
        home: IndexPage(),
      )
    );
  }
}