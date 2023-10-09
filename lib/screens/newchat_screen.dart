import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_ui/helpers/app_colors.dart';
import 'package:whatsapp_ui/helpers/app_styles.dart';
import 'package:whatsapp_ui/helpers/data.dart';

class NewChatScreen extends StatefulWidget {
  const NewChatScreen({super.key});

  @override
  State<NewChatScreen> createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarColor = AppColors.getAppBarColor(theme);
    final backgroundColor = AppColors.getBackgroundColor(theme);
    final primaryColor = AppColors.getPrimaryColor(theme);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select contact',
              style: GoogleFonts.roboto(
                color: AppColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              '10 contacts',
              style: GoogleFonts.roboto(
                color: AppColors.textColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: const [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.search,
                size: 30,
                color: AppColors.textColor,
              ),
              Gutter(),
              Icon(
                Icons.more_vert,
                size: 30,
                color: AppColors.textColor,
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: primaryColor,
                child: Icon(
                  Icons.group,
                  color: AppColors.textColor,
                ),
              ),
              title: Text(
                'New group',
                style: TextStyles.getLargeFont(context),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: primaryColor,
                child: Icon(
                  Icons.group,
                  color: AppColors.textColor,
                ),
              ),
              title: Text(
                'New contact',
                style: TextStyles.getLargeFont(context),
              ),
              trailing: const Icon(
                Icons.qr_code,
                size: 30,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: primaryColor,
                child: Icon(
                  Icons.group,
                  color: AppColors.textColor,
                ),
              ),
              title: Text(
                'New community',
                style: TextStyles.getLargeFont(context),
              ),
            ),
            const Gutter(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Contacts on WhatsApp',
                style: TextStyles.smallFont,
              ),
            ),
            const Gutter(),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 78,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(images[index]),
                    ),
                    title: Text(
                      chatContacts[index],
                      style: TextStyles.getMediumFont(context),
                    ),
                    subtitle: Text(
                      statusList[index],
                      style: TextStyles.smallFont,
                    ),
                  ),
                );
              },
            ),
            const Gutter(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Invite to WhatsApp',
                style: TextStyles.smallFont,
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 78,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade400,
                      child: const Icon(
                        Icons.person,
                        size: 30,
                      ),
                    ),
                    title: Text(
                      inviteList[index],
                      style: TextStyles.getMediumFont(context),
                    ),
                    trailing: Text(
                      'Invite',
                      style: TextStyles.inviteText,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
