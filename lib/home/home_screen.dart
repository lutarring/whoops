import 'package:flutter/material.dart';
import '../home/constants.dart' show Constants;

class NavigationIconView {
  final String _title;
  final IconData _icon;
  final IconData _activeIcon;
  final BottomNavigationBarItem bottomNavigationBarItem;

  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon})
      : _title = title,
        _icon = icon,
        _activeIcon = activeIcon,
        bottomNavigationBarItem = new BottomNavigationBarItem(
            title: Text(title),
            icon: Icon(icon),
            activeIcon: Icon(activeIcon),
            backgroundColor: Colors.teal);
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationViews;

  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
          title: '微信',
          icon: IconData(0xe60e, fontFamily: Constants.IconFontFamily),
          activeIcon: IconData(0xe64f, fontFamily: Constants.IconFontFamily)),
      NavigationIconView(
          title: '通讯录',
          icon: IconData(0x10019, fontFamily: Constants.IconFontFamily),
          activeIcon: IconData(0xe60b, fontFamily: Constants.IconFontFamily)),
      NavigationIconView(
          title: '发现',
          icon: IconData(0xe67c, fontFamily: Constants.IconFontFamily),
          activeIcon: IconData(0xecf0, fontFamily: Constants.IconFontFamily)),
      NavigationIconView(
          title: '我',
          icon: IconData(0xe651, fontFamily: Constants.IconFontFamily),
          activeIcon: IconData(0xe638, fontFamily: Constants.IconFontFamily)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
        items: _navigationViews
            .map((NavigationIconView navigationView) =>
                navigationView.bottomNavigationBarItem)
            .toList(),
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          print('点击的是第$index 个Tab');
        });

    return Scaffold(
      appBar: AppBar(
        title: Text('WeChat'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('点击了搜索按钮');
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('点击了添加按钮');
            },
          )
        ],
      ),
      body: Container(
        color: Colors.white,
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
