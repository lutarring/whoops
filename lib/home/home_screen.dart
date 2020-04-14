import 'package:flutter/material.dart';

class NavigationIconView {
  final String _title;
  final Widget _icon;
  final Widget _activeIcon;
  final BottomNavigationBarItem bottomNavigationBarItem;

  NavigationIconView({Key key, String title, Widget icon, Widget activeIcon})
      : _title = title,
        _icon = icon,
        _activeIcon = activeIcon,
        bottomNavigationBarItem = new BottomNavigationBarItem(
            title: Text(title),
            icon: icon,
            activeIcon: activeIcon,
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
          icon: const Icon(Icons.chat_bubble),
          activeIcon: const Icon(Icons.chat_bubble)),
      NavigationIconView(
          title: '通讯录',
          icon: const Icon(Icons.contacts),
          activeIcon: const Icon(Icons.chat_bubble)),
      NavigationIconView(
          title: '发现',
          icon: const Icon(Icons.explore),
          activeIcon: const Icon(Icons.chat_bubble)),
      NavigationIconView(
          title: '我',
          icon: const Icon(Icons.menu),
          activeIcon: const Icon(Icons.chat_bubble)),
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
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Colors.white,
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
