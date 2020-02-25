import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/index_page.dart';

import './provider/count.dart';

void main() {
  final counter = Counter();
  final textSize1 = 18;
  final textSize = 48;

  // runApp(
  //   Provider<int>.value(
  //     value: textSize,
  //     child: ChangeNotifierProvider.value(
  //       value: counter,
  //       child: MyApp(),
  //     ),
  //   ),
  // );
  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: textSize),
        ChangeNotifierProvider.value(value: counter)
      ],
      child: MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<Counter>(context);
    final textSize = Provider.of<int>(context).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: Text('FirstPage'),
      ),
      body: Center(
        child: Text(
          'Value: ${_counter.count}',
          style: TextStyle(fontSize: textSize),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Consumer2<Counter,int>(
        builder: (context, Counter counter, int textSize, _) => Center(
              child: Text(
                'Value: ${counter.count}',
                style: TextStyle(
                  fontSize: textSize.toDouble(),
                ),
              ),
            ),
      ),
      floatingActionButton: Consumer<Counter>(
        builder: (context, Counter counter, child) => FloatingActionButton(
              onPressed: counter.increment,
              child: child,
            ),
        child: Icon(Icons.add),
      ),
    );
  }
}


/* class MyApp extends StatelessWidget {
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
} */