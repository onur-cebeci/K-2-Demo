import 'package:flutter/material.dart';
import 'package:k12_demo_proje/utils/constant.dart';
import 'package:k12_demo_proje/utils/custom_theme_data.dart';
import 'package:k12_demo_proje/utils/extensions.dart';
import 'package:k12_demo_proje/utils/fonts.dart';

class CustomShowDialog {
  CustomShowDialog.showMessage(BuildContext context,
      {required String title,
      required String subtitle,
      required double height,
      required double width,
      required void Function()? onTap,
      IconData iconData = Icons.done}) {
    Size size = MediaQuery.of(context).size;

    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Form(
          key: formKey,
          child: Center(
            child: SizedBox(
              width: width,
              height: height,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppConstant.padding10),
                  child: Column(
                    children: [
                      const Spacer(),
                      context.sizedBoxHeightExtraSmall,
                      Text(
                        title,
                        style: CustomFonts.customFont18Bold.copyWith(
                          color: CustomThemeData.primaryColor,
                        ),
                      ),
                      context.sizedBoxHeightUltraSmall,
                      Text(
                        subtitle,
                        style: CustomFonts.customFont13SemiBold.copyWith(
                          color: context.disabledColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: size.width / 3,
                        child: MaterialButton(
                          onPressed: onTap,
                          child: const Text(AppConstant.accept),
                        ),
                      ),
                      SizedBox(
                        width: size.width / 3,
                        child: MaterialButton(
                          onPressed: () {},
                          child: const Text(
                            AppConstant.cancel,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      context.sizedBoxHeightExtraSmall,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
