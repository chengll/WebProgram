import 'package:WebProgram/pages/cart_page.dart';
import 'package:WebProgram/pages/category_page.dart';
import 'package:WebProgram/pages/home_page.dart';
import 'package:WebProgram/pages/member_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomsTabs = [
    //制作底部导航栏Icon和文本
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: '分类'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart), label: '购物车'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.plus), label: '会员中心')
  ];

  //将需要切换的页面存入数组
  final List tabBodies = [HomePage(), CategoryPage(), CartPage(), MemberPage()];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = tabBodies[currentIndex]; //设置默认选中的tab
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(245, 245, 245, 1),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomsTabs,
        onTap: (index) {
          //点击切换页面
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
