import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k12_demo_proje/controllers/home_screen_controllers.dart/home_screen_controller.dart';
import 'package:k12_demo_proje/models/home_screen_datas_models/home_screen_data_model.dart';
import 'package:k12_demo_proje/utils/constant.dart';
import 'package:k12_demo_proje/utils/custom_theme_data.dart';
import 'package:k12_demo_proje/utils/extensions.dart';
import 'package:k12_demo_proje/utils/fonts.dart';
import 'package:k12_demo_proje/utils/loader.dart';
import 'package:k12_demo_proje/widgets/custom_app_bar.dart';
import 'package:k12_demo_proje/widgets/custom_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return GetBuilder(
      builder: (HomeScreenController homeScreenController) {
        if (controller.status == HomeStatus.loading) {
          return const Loader();
        } else if (controller.status == HomeStatus.success) {
          return Scaffold(
            backgroundColor: CustomThemeData.whiteColor,
            appBar: const CustomAppBar(),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomSearchBar(),
                  const SizedBox(height: AppConstant.padding30),
                  CategoryRow(controller: controller),
                  const SizedBox(height: AppConstant.padding30),
                  ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.checkCurrentPage().length,
                    itemBuilder: (context, index) {
                      var i = controller.checkCurrentPage()[index];
                      return NewsCard(data: i);
                    },
                  )
                ],
              ),
            )),
          );
        } else {
          return Container(
            color: Colors.red,
            child: const Center(
              child: Icon(Icons.error),
            ),
          );
        }
      },
    );
  }
}

//List Card Widget
class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.data,
  });
  final DataModel data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/detail_screen', arguments: {'data': data});
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppConstant.padding20),
        padding: const EdgeInsets.symmetric(vertical: AppConstant.padding20),
        height: context.dynamicHeight(0.195),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: context.dynamicWidth(0.38),
              child: Image.network(
                data.image,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: AppConstant.padding15),
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: AppConstant.padding10),
              width: context.dynamicWidth(0.4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    style: CustomFonts.customFont16Bold,
                  ),
                  Text(
                    data.publishedAt,
                    style: CustomFonts.customFont13,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Category buttons row
class CategoryRow extends StatelessWidget {
  const CategoryRow({
    super.key,
    required this.controller,
  });

  final HomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
            onPressed: () {
              controller.changeCurrentPage(pageIndex: 0);
            },
            child: Text(
              'Featured',
              style: controller.currentPage == 0
                  ? CustomFonts.customFont18Bold
                  : CustomFonts.customFont18Bold
                      .copyWith(color: CustomThemeData.disabledColor),
            )),
        TextButton(
            onPressed: () {
              controller.changeCurrentPage(pageIndex: 1);
            },
            child: Text(
              'Latest',
              style: controller.currentPage == 1
                  ? CustomFonts.customFont18Bold
                  : CustomFonts.customFont18Bold
                      .copyWith(color: CustomThemeData.disabledColor),
            )),
        TextButton(
            onPressed: () {
              controller.changeCurrentPage(pageIndex: 2);
            },
            child: Text(
              'Trending',
              style: controller.currentPage == 2
                  ? CustomFonts.customFont18Bold
                  : CustomFonts.customFont18Bold
                      .copyWith(color: CustomThemeData.disabledColor),
            )),
      ],
    );
  }
}
