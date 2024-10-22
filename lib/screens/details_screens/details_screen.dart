import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k12_demo_proje/models/home_screen_datas_models/home_screen_data_model.dart';
import 'package:k12_demo_proje/utils/constant.dart';
import 'package:k12_demo_proje/utils/custom_theme_data.dart';
import 'package:k12_demo_proje/utils/extensions.dart';
import 'package:k12_demo_proje/utils/fonts.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.data});
  final DataModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: context.dynamicHeight(0.7),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(data.image), fit: BoxFit.fill)),
                ),
                Positioned(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: CustomThemeData.blackColor,
                        size: AppConstant.padding20,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Transform.rotate(
                      angle: 180 * (3.1415927 / 180),
                      child: IconButton(
                        icon: const Icon(
                          Icons.remove,
                          color: CustomThemeData.blackColor,
                          size: AppConstant.padding30,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                )),
                Positioned(
                    bottom: 0,
                    right: context.dynamicWidth(0.42),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(
                            bottom: AppConstant.padding25),
                        decoration: BoxDecoration(
                            color: CustomThemeData.whiteColor,
                            borderRadius:
                                BorderRadius.circular(AppConstant.padding10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppConstant.padding10,
                            vertical: AppConstant.padding5),
                        child: const Text(AppConstant.read),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(AppConstant.padding15),
              child: Text(
                data.title,
                style: CustomFonts.customFont18Bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppConstant.padding15),
              child: Text(
                data.content,
                style: CustomFonts.customFont16,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
