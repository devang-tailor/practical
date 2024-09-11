import 'package:flutter/material.dart';
import 'package:practicaldevang/infrasturcture/constants/color_constant.dart';
import 'package:practicaldevang/infrasturcture/constants/font_family_constant.dart';
import 'package:practicaldevang/infrasturcture/models/package_list_response_model.dart';

class PackagesListWidget extends StatelessWidget {
  final List<PackageData> packagesList;

  const PackagesListWidget({super.key, required this.packagesList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (index + 1) % 2 == 0
                  ? ColorConstant.blueLightColor
                  : ColorConstant.pinkColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 40,
                      color: (index + 1) % 2 == 0
                          ? Colors.white
                          : ColorConstant.primaryColor,
                    ),
                    SizedBox(
                      height: 26,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: (index + 1) % 2 == 0
                                  ? ColorConstant.blueDarkColor
                                  : ColorConstant.primaryColor,
                              elevation: 3),
                          onPressed: () {},
                          child: const Text(
                            'Book Now',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: FontFamilyConstant.fontFamilyRegular,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          packagesList[index].title ?? '',
                          style: const TextStyle(
                              color: ColorConstant.secondaryColor,
                              fontFamily: FontFamilyConstant.fontFamilyRegular,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        Text(
                          '\₹${packagesList[index].price ?? ''}',
                          style: const TextStyle(
                              color: ColorConstant.secondaryColor,
                              fontFamily: FontFamilyConstant.fontFamilyRegular,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      packagesList[index].desc ?? '',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 18),
        itemCount: packagesList.length);
  }
}
