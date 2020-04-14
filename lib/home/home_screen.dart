import 'package:flutter/material.dart';
import '../home/constants.dart' show Constants;
import '../home/constants.dart';

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
          title: Text(
            title,
            style: TextStyle(
                fontSize: 14.0, color: Color(AppColors.TabIconNormal)),
          ),
          icon: Icon(icon, color: Color(AppColors.TabIconNormal)),
          activeIcon: Icon(activeIcon, color: Color(AppColors.TabIconActive)),
        );
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
          icon: Icons.chat_bubble_outline,
          activeIcon: Icons.chat_bubble),
      NavigationIconView(
          title: '通讯录',
          icon: Icons.perm_contact_calendar,
          activeIcon: Icons.perm_contact_calendar),
      NavigationIconView(
          title: '发现', icon: Icons.explore, activeIcon: Icons.explore),
      NavigationIconView(
          title: '我', icon: Icons.perm_identity, activeIcon: Icons.person),
    ];
  }

  _buildPopupMemuItem(IconData icon, String title) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Color(AppColors.TabIconNormal),
        ),
        Container(width: 16.0),
        Text(
          title,
          style: TextStyle(color: Color(AppColors.TabIconNormal)),
        )
      ],
    );
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
        title: Text('微信'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('点击了搜索按钮');
            },
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<String>>[
                PopupMenuItem(
                  child: _buildPopupMemuItem(Icons.add, "发起群聊"),
                  value: "grounp_chat",
                ),
                PopupMenuItem(
                  child: _buildPopupMemuItem(Icons.group_add, "添加朋友"),
                  value: "grounp_chat",
                ),
                PopupMenuItem(
                  child: _buildPopupMemuItem(Icons.filter_center_focus, "扫一扫"),
                  value: "grounp_chat",
                ),
                PopupMenuItem(
                  child: _buildPopupMemuItem(Icons.monetization_on, "首付款"),
                  value: "grounp_chat",
                )
              ];
            },
            icon: Icon(
              Icons.add,
              color: Color(AppColors.TabIconNormal),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
