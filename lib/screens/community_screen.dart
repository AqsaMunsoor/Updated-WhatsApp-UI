import 'package:flutter/material.dart';

import 'package:whatsapp_ui/helpers/app_colors.dart';
import 'package:whatsapp_ui/helpers/app_styles.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = AppColors.getBackgroundColor(theme);
    final primaryColor = AppColors.getPrimaryColor(theme);
    return Container(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                leading: Stack(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const ShapeDecoration(
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              side: BorderSide()),
                        ),
                        child: const Icon(
                          Icons.groups,
                          color: AppColors.textColor,
                          size: 40,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -2,
                      right: -2,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 13,
                        child: CircleAvatar(
                          radius: 11,
                          backgroundColor: primaryColor,
                          child: Icon(
                            Icons.add,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                title: Text(
                  'New Community',
                  style: TextStyles.getLargeFont(context),
                ),
              )
            ],
          ),
        ));
  }
}
