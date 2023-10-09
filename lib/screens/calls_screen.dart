import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import 'package:whatsapp_ui/helpers/app_colors.dart';
import 'package:whatsapp_ui/helpers/app_styles.dart';
import 'package:whatsapp_ui/helpers/data.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = AppColors.getBackgroundColor(theme);
    final primaryColor = AppColors.getPrimaryColor(theme);
    return Container(
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Icon(Icons.link,
                      color: theme.brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white),
                ),
                const Gutter(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create call link',
                      style: TextStyles.getLargeFont(context),
                    ),
                    Text(
                      'Share a link for your WhatsApp call',
                      style: TextStyles.smallFont,
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Recent',
              style: TextStyles.getMediumFont(context),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 78,
                  width: double.maxFinite,
                  child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(images[index]),
                      ),
                      title: Text(
                        chatContacts[index],
                        style: TextStyles.getMediumFont(context),
                      ),
                      subtitle: Text(
                        "Yesterday",
                        style: TextStyles.smallFont,
                      ),
                      trailing: Icon(
                        Icons.call,
                        color: primaryColor,
                      )),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
