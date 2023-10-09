import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_ui/helpers/app_colors.dart';
import 'package:whatsapp_ui/helpers/app_styles.dart';
import 'package:whatsapp_ui/widgets/channel_list.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = AppColors.getBackgroundColor(theme);
    final primaryColor = AppColors.getPrimaryColor(theme);
    return Container(
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status',
                  style: TextStyles.getLargerFont(context),
                ),
                const Icon(
                  Icons.more_vert,
                  color: AppColors.subtitleColor,
                )
              ],
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?size=626&ext=jpg'),
            ),
            title: Text(
              'My status',
              style: TextStyles.getLargeFont(context),
            ),
            subtitle: Text(
              'Tap to add status update',
              style: TextStyles.smallFont,
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Text(
                'Viewed Status',
                style: TextStyles.smallFont,
              ),
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: Text(
                    'Ali',
                    style: TextStyles.getLargeFont(context),
                  ),
                  subtitle: Text(
                    'Today 2:45pm',
                    style: TextStyles.smallFont,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: Text(
                    'Ahmed',
                    style: TextStyles.getLargeFont(context),
                  ),
                  subtitle: Text(
                    'Yesterday',
                    style: TextStyles.smallFont,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: theme.brightness == Brightness.dark
                ? Colors.white10
                : Colors.black12,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Channels',
                  style: TextStyles.getLargerFont(context),
                ),
                const Icon(
                  Icons.add,
                  color: AppColors.subtitleColor,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: 310,
              child: Text(
                'Stay updated on topics that matter to you. Find channele to follow below.',
                style: TextStyles.smallFont,
              ),
            ),
          ),
          const Gutter(),
          const ChannelsList(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: primaryColor,
              ),
              child: Text(
                'Find channels',
                style: GoogleFonts.roboto(
                    color: theme.brightness == Brightness.dark
                        ? Colors.black
                        : Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
  }
}
