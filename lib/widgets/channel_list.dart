import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_ui/helpers/app_colors.dart';
import 'package:whatsapp_ui/helpers/app_styles.dart';
import 'package:whatsapp_ui/helpers/data.dart';

class ChannelsList extends StatelessWidget {
  const ChannelsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = AppColors.getPrimaryColor(theme);
    return SizedBox(
      height: 180,
      child: Expanded(
        child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              width: 140,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: theme.brightness == Brightness.dark
                          ? Colors.white10
                          : Colors.black12),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          channelLogos[index],
                          width: 60,
                          height: 60,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            minRadius: 15,
                            backgroundColor: theme.brightness == Brightness.dark
                                ? Colors.black
                                : Colors.white,
                            child: Icon(
                              Icons.verified,
                              color: primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      channelNames[index],
                      style: TextStyles.getMediumFont(context),
                    ),
                    SizedBox(
                      width: 100,
                      height: 35,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          backgroundColor: theme.brightness == Brightness.dark
                              ? Color(0xFF1D3D3C)
                              : Color(0xFFE0FEF2),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Follow',
                          style: GoogleFonts.roboto(
                            color: theme.brightness == Brightness.dark
                                ? Color(0xFFE0FEF2)
                                : Color(0xFF027F69),
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
