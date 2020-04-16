import 'package:flutter/material.dart';
import '../home/constants.dart' show Constants;
import '../home/constants.dart';
import 'package:oops/home/conversation_page.dart';

class NavigationIconView {
  final BottomNavigationBarItem bottomNavigationBarItem;

  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon})
      : bottomNavigationBarItem = new BottomNavigationBarItem(
          title: Text(title),
          icon: Icon(icon),
          activeIcon: Icon(activeIcon),
        );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<Widget> _pages;

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
    _pageController = PageController(initialPage: _currentIndex);
    _pages = [
      ConversationPage(),
      Container(
        color: Colors.orange,
      ),
      Container(
        color: Colors.yellow,
      ),
      Container(
        color: Colors.green,
      ),
    ];
  }

  _buildPopupMemuItem(IconData icon, String title) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: const Color(AppColors.PopupMenuTextColor),
          size: 18.0,
        ),
        Container(width: 12.0),
        Text(
          title,
          style: TextStyle(
              color: const Color(AppColors.PopupMenuTextColor), fontSize: 18.0),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
        fixedColor: Color(AppColors.TabIconActive),
        items: _navigationViews
            .map((NavigationIconView navigationView) =>
                navigationView.bottomNavigationBarItem)
            .toList(),
        currentIndex: _currentIndex,
        //点击控制
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;

            _pageController.animateToPage(_currentIndex,
                duration: Duration(microseconds: 200), curve: Curves.easeInOut);
          });

          print('点击的是第 $index 个Tab');
        });

    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0,
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
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: PageView.builder(
          itemBuilder: (BuildContext context, int index) {return _pages[index];},
          controller: _pageController,
          itemCount: _pages.length,
          onPageChanged: (int index) {
            setState(() {
              _currentIndex = index;
            });
            print("当前是第 $index 页");
          }),
      bottomNavigationBar: botNavBar,
    );
  }
}
