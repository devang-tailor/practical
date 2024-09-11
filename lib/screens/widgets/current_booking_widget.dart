import 'package:flutter/material.dart';
import 'package:practicaldevang/infrasturcture/constants/app_constant.dart';
import 'package:practicaldevang/infrasturcture/constants/color_constant.dart';
import 'package:practicaldevang/infrasturcture/constants/font_family_constant.dart';
import 'package:practicaldevang/infrasturcture/models/current_booking_response_model.dart';

class CurrentBookingWidget extends StatelessWidget {
  final CurrentBookingData bookingData;

  const CurrentBookingWidget({super.key, required this.bookingData});

  @override
  Widget build(BuildContext context) {
    TextStyle commonTextStyle = const TextStyle(
        color: ColorConstant.greyColor,
        fontFamily: FontFamilyConstant.fontFamilyRegular,
        fontSize: 16,
        fontWeight: FontWeight.w500);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                bookingData.title ?? '',
                style: const TextStyle(
                    color: ColorConstant.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              SizedBox(
                height: 20,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fixedSize: const Size(80.0, 0.0),
                        backgroundColor: ColorConstant.primaryColor,
                        elevation: 3),
                    onPressed: () {},
                    child: const Text(
                      AppConstant.start,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppConstant.from,
                    style: TextStyle(
                        color: ColorConstant.greyColor,
                        fontFamily: FontFamilyConstant.fontFamilyRegular,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_sharp,
                        color: ColorConstant.primaryColor,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        bookingData.fromDate ?? '',
                        style: commonTextStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_sharp,
                        color: ColorConstant.primaryColor,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        bookingData.fromTime ?? '',
                        style: commonTextStyle,
                      )
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppConstant.to,
                    style: TextStyle(
                        color: ColorConstant.greyColor,
                        fontFamily: FontFamilyConstant.fontFamilyRegular,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_sharp,
                        color: ColorConstant.primaryColor,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        bookingData.toDate ?? '',
                        style: commonTextStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_sharp,
                        color: ColorConstant.primaryColor,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        bookingData.toTime ?? '',
                        style: TextStyle(
                            color: ColorConstant.greyColor,
                            fontFamily: FontFamilyConstant.fontFamilyRegular,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 24,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: ColorConstant.secondaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        elevation: 3),
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(
                          Icons.star_border,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(width: 3,),
                        Text(
                          AppConstant.rateUs,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: FontFamilyConstant.fontFamilyRegular,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 24,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: ColorConstant.secondaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        elevation: 3),
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(width: 3,),
                        Text(
                          AppConstant.geolocation,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: FontFamilyConstant.fontFamilyRegular,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 24,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: ColorConstant.secondaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 0),
                        elevation: 3),
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(
                          Icons.mic_off_outlined,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(width: 3,),
                        Text(
                          AppConstant.surveillance,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: FontFamilyConstant.fontFamilyRegular,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
