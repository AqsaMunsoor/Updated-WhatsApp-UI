import 'package:flutter/material.dart';
import 'package:whatsapp_ui/helpers/app_colors.dart';
import 'package:whatsapp_ui/helpers/app_styles.dart';
import 'package:whatsapp_ui/helpers/data.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = AppColors.getBackgroundColor(theme);
    return Container(
      color: backgroundColor,
      child: ListView.builder(
        itemCount: chatsList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  images[index],
                ),
              ),
              title: Text(
                chatContacts[index],
                style: TextStyles.getMediumFont(context),
              ),
              subtitle: Text(
                chatsList[index],
                style: TextStyles.smallFont,
              ),
              trailing: Text(
                chatsTime[index],
                style: TextStyles.smallerFont,
              ),
            ),
          );
        },
      ),
    );
  }
}
