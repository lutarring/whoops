import 'package:flutter/material.dart';

import 'home/home_screen.dart';
import 'home/constants.dart';

void main() => runApp(MaterialApp(
      title: 'WeChat',
      theme: ThemeData.light().copyWith(
          primaryColor: Color(AppColors.AppBarColor),
          cardColor: Color(AppColors.PopupMenuColor)
      ),
      home: HomeScreen(),
    ));
