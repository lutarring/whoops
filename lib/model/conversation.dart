import 'package:flutter/material.dart';
import 'package:oops/home/constants.dart' show AppColors;

class Conversation {
  const Conversation({@required this.avatar,
    @required this.title,
    this.titleColor: 0xff000000,
    this.description,
    @required this.createTime,
    this.isMute: false,
    this.unreadMessageCount = 0,
    this.displayDot = false})
      : assert(avatar != null),
        assert(title != null),
        assert(createTime != null);

  final String avatar;
  final String title;
  final int titleColor;
  final String description;
  final String createTime;
  final bool isMute;
  final int unreadMessageCount;
  final bool displayDot;
}

const List<Conversation> mockConversation = [
  const Conversation(
    avatar:
    'assets/images/image08.jpg',
    title: '可妮兔',
    description: '想吃冰淇淋。',
    createTime: '17:34',
    isMute: false,
    unreadMessageCount: 2,
  ),
  const Conversation(
    avatar:
    'assets/images/image07.jpg',
    title: 'WOWO',
    description: '你看我的新发型怎样！',
    createTime: '13:34',
    isMute: true,
    unreadMessageCount: 0,
  ),
  const Conversation(
    avatar:
    'assets/images/image09.jpg',
    title: '布朗熊',
    description: '我们陪可妮兔去吃吃冰淇淋吧！',
    createTime: '17:42',
    isMute: false,
    unreadMessageCount: 1,
  ),
  const Conversation(
    avatar:
    'assets/images/image02.jpg',
    title: '莎莉鸡',
    description: '你今天作业写完了吗？',
    createTime: '15:35',
    isMute: false,
    unreadMessageCount: 1,
  ),
  const Conversation(
    avatar:
    'assets/images/image06.jpg',
    title: 'MOMO',
    description: '我的演唱会你一定要来哦！',
    createTime: '12:03',
    isMute: false,
    unreadMessageCount: 0,
  ),
  const Conversation(
    avatar:
    'assets/images/image05.jpg',
    title: 'VOVO',
    description: '听说明天是个好天气呢。',
    createTime: '13:34',
    isMute: true,
    unreadMessageCount: 0,
  ),
  const Conversation(
    avatar:
    'assets/images/image11.jpg',
    title: '大熊熊',
    description: '来谈一场恋爱吧？',
    createTime: '17:34',
    isMute: false,
    unreadMessageCount: 2,
  ),
  const Conversation(
    avatar:
    'assets/images/image09.jpg',
    title: '布朗熊',
    description: 'Zzzzzzz',
    createTime: '17:42',
    isMute: false,
    unreadMessageCount: 1,
  ),
  const Conversation(
    avatar:
    'assets/images/image02.jpg',
    title: '莎莉鸡',
    description: '你今天作业写完了吗？',
    createTime: '15:35',
    isMute: false,
    unreadMessageCount: 1,
  ),
  const Conversation(
    avatar:
    'assets/images/image06.jpg',
    title: 'MOMO',
    description: '',
    createTime: '12:03',
    isMute: false,
    unreadMessageCount: 0,
  ),
  const Conversation(
    avatar:
    'assets/images/image09.jpg',
    title: 'VOVO',
    description: '',
    createTime: '13:34',
    isMute: true,
    unreadMessageCount: 0,
  ),
];
