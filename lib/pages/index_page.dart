import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'home_page.dart';
import 'category_pag.dart';
import 'cart_page.dart';
import 'member_page.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 0;
  var _currentPage;
  PageController _pageController;

  @override
  void initState() {
    _currentPage=tabs[_currentIndex];
    _pageController = new PageController()
      ..addListener(() {
        if (_currentPage != _pageController.page.round()) {
          setState(() {
            _currentPage = _pageController.page.round();
          });
        }
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('百姓生活+'),),
      body: IndexedStack(
        index: _currentIndex,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            _currentIndex = index;
            _currentPage = tabs[_currentIndex];
          });
        }
      )
    );
  }
}

final List<Widget> tabs = [
  HomePage(),
  CategoryPage(),
  CartPage(),
  MemberPage()
];

final List<BottomNavigationBarItem> bottomTabs = [
  BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.home),
    title: Text('首页'),
  ),
  BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.shopping_cart),
    title: Text('分类'),
  ),
  BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.shopping_cart),
    title: Text('购物车'),
  ),
  BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.profile_circled),
    title: Text('会员中心'),
  ),
];


