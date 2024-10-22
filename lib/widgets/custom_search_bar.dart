import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k12_demo_proje/utils/constant.dart';
import 'package:k12_demo_proje/utils/custom_theme_data.dart';
import 'package:k12_demo_proje/utils/extensions.dart';

//Home Screen search bar widget
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.07),
      margin: const EdgeInsets.symmetric(horizontal: AppConstant.padding20),
      decoration: const BoxDecoration(
          color: CustomThemeData.backgroudColor,
          borderRadius:
              BorderRadius.all(Radius.circular(AppConstant.padding15))),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstant.padding10),
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: AppConstant.search,
              icon: Icon(CupertinoIcons.search)),
        ),
      ),
    );
  }
}
