import 'package:flutter/material.dart';
import 'package:oops/home/constants.dart';
import '../model/conversation.dart' show Conversation, mockConversation;

class _ConversationItem extends StatelessWidget {
  const _ConversationItem({Key key, this.conversation})
      : assert(conversation != null),
        super(key: key);
  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Color(AppColors.ConversationItemBg),
          border: Border(
              bottom: BorderSide(
                  color: Color(AppColors.DividerColor),
                  width: Constants.DividerWidth))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset(
              conversation.avatar,
              width: Constants.ConversationAvatarSize,
              height: Constants.ConversationAvatarSize,
            ),
            width: 55,
          ),
          Container(width: 10.0),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(conversation.title, style: AppStyles.TitleStyle),
                  Text(conversation.description, style: AppStyles.DesStyle)
                ],
              )),
          Container(width: 10.0),
          Container(
            child: Column(
              children: <Widget>[
                Text(conversation.createTime, style: AppStyles.DesStyle)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _ConversationItem(conversation: mockConversation[index]);
        },
        itemCount: mockConversation.length);
  }
}
