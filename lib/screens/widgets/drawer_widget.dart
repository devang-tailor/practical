import 'package:flutter/material.dart';
import 'package:practicaldevang/infrasturcture/constants/app_constant.dart';
import 'package:practicaldevang/infrasturcture/constants/color_constant.dart';
import 'package:practicaldevang/infrasturcture/constants/image_constant.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle =  const TextStyle(
        color: ColorConstant.naviBlue,
        fontFamily: "AlegreyaSans",
        fontSize: 18,
        fontWeight: FontWeight.w500);

    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ColorConstant.primaryColor),
                  shape: BoxShape.circle),
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(50),
                  child: Image.network(
                    ImageConstant.userImages,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              AppConstant.name,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: ColorConstant.primaryColor),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    AppConstant.home,
                    style: textStyle,
                  ),
                ),
                const Divider(
                  color: ColorConstant.primaryColor,
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    AppConstant.bookANanny,
                    style: textStyle,
                  ),
                ),
                const Divider(
                  color: ColorConstant.primaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    AppConstant.howItWorks,
                    style: textStyle,
                  ),
                ),
                const Divider(
                  color: ColorConstant.primaryColor,
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    AppConstant.whyNannyVanny,
                    style: textStyle,
                  ),
                ),
                const Divider(
                  color: ColorConstant.primaryColor,
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    AppConstant.myBooking,
                    style: textStyle,
                  ),
                ),
                const Divider(
                  color: ColorConstant.primaryColor,
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    AppConstant.myProfile,
                    style: textStyle,
                  ),
                ),
                const Divider(
                  color: ColorConstant.primaryColor,
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    AppConstant.support,
                    style: textStyle,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
