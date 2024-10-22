import 'package:flutter/material.dart';
import 'package:k12_demo_proje/utils/constant.dart';
import 'package:k12_demo_proje/utils/custom_theme_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//Home Screen app bar widget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomThemeData.whiteColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.short_text,
          color: CustomThemeData.blackColor,
          size: AppConstant.padding30,
        ),
        onPressed: () {},
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: AppConstant.padding20),
          height: AppConstant.padding35,
          width: AppConstant.padding35,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(AppConstant.padding10),
              ),
              image: DecorationImage(image: NetworkImage(AppConstant.imgURL))),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppConstant.padding10.h);
}
