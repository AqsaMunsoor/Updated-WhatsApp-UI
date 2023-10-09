import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_ui/helpers/app_colors.dart';
import 'package:whatsapp_ui/helpers/app_styles.dart';
import 'package:whatsapp_ui/helpers/data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarColor = AppColors.getAppBarColor(theme);
    final backgroundColor = AppColors.getBackgroundColor(theme);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
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
        title: Text(
          'You',
          style: GoogleFonts.roboto(
            color: AppColors.textColor,
            fontSize: 25,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: const [
          Icon(
            Icons.search,
            size: 30,
            color: AppColors.textColor,
          ),
          Gutter(),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const Gutter(),
            const Stack(children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?size=626&ext=jpg'),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Color(0xFF3AB69B),
                  child: Icon(
                    Icons.qr_code,
                    color: Colors.white,
                  ),
                ),
              ),
            ]),
            const Gutter(),
            const Gutter(),
            Text(
              'Busy',
              style: GoogleFonts.roboto(
                color: AppColors.subtitleColor,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Gutter(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Gutter(),
                Column(
                  children: [
                    const Icon(
                      Icons.account_circle_outlined,
                      color: Color(0xFF3AB69B),
                      size: 25,
                    ),
                    const Gutter(),
                    Text(
                      'Profile',
                      style: TextStyles.profileTexts,
                    ),
                  ],
                ),
                const Gutter(),
                Column(
                  children: [
                    const Icon(
                      Icons.lock,
                      color: Color(0xFF3AB69B),
                      size: 25,
                    ),
                    const Gutter(),
                    Text(
                      'Privacy',
                      style: TextStyles.profileTexts,
                    ),
                  ],
                ),
                const Gutter(),
                Column(
                  children: [
                    const Icon(
                      Icons.contacts,
                      color: Color(0xFF3AB69B),
                      size: 25,
                    ),
                    const Gutter(),
                    Text(
                      'Contacts',
                      style: TextStyles.profileTexts,
                    ),
                  ],
                ),
                const Gutter(),
              ],
            ),
            const Gutter(),
            ListTile(
              leading: Icon(
                Icons.star_border,
                size: 25,
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
              title: Text('Starred messages',
                  style: TextStyles.getLargeFont(context)),
            ),
            const Gutter(),
            ListTile(
              leading: Icon(
                Icons.devices_other,
                size: 25,
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
              title: Text(
                'Linked devices',
                style: TextStyles.getLargeFont(context),
              ),
            ),
            Divider(
              color: theme.brightness == Brightness.dark
                  ? Colors.white10
                  : Colors.black12,
            ),
            const Gutter(),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    icons[index],
                    size: 25,
                    color: theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  title: Text(
                    titles[index],
                    textAlign: TextAlign.justify,
                    style: TextStyles.getLargeFont(context),
                  ),
                  subtitle: Text(
                    subtitles[index],
                    textAlign: TextAlign.justify,
                    style: TextStyles.smallFont,
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.group_outlined,
                size: 25,
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
              title: Text(
                'Invite a friend',
                textAlign: TextAlign.justify,
                style: TextStyles.getLargeFont(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
