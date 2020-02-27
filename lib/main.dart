import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import 'pages/index_page.dart';

//provider
import './provider/count.dart';
import './provider/child_category.dart';
import './provider/category_goods_list.dart';

void main(){
  var counter =Counter();
  var childCategory=ChildCategory();
  var providers  =Providers();

  providers
    ..provide(Provider<ChildCategory>.value(childCategory));

  runApp(ProviderNode(child:MyApp(),providers:providers));
}
/*   runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: counter),
        ChangeNotifierProvider.value(value: price),
        ChangeNotifierProvider.value(value: childCategory),
      ],
      child: MyApp(),
    ),
  ); */

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