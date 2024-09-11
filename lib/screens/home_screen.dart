import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicaldevang/infrasturcture/constants/app_constant.dart';
import 'package:practicaldevang/infrasturcture/constants/color_constant.dart';
import 'package:practicaldevang/infrasturcture/constants/font_family_constant.dart';
import 'package:practicaldevang/infrasturcture/constants/image_constant.dart';
import 'package:practicaldevang/infrasturcture/providers/provider_registration.dart';
import 'package:practicaldevang/screens/widgets/current_booking_widget.dart';
import 'package:practicaldevang/screens/widgets/drawer_widget.dart';
import 'package:practicaldevang/screens/widgets/packages_list_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(homeProvider).currentBookingApi();
      ref.read(homeProvider).fetchPackageDataApi();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeWatch = ref.watch(homeProvider);

    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      openRatio: 0.6,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 0.6,
              offset: const Offset(-4, 4),
              blurStyle: BlurStyle.inner),
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 0.6,
              offset: const Offset(0, -4),
              blurStyle: BlurStyle.inner)
        ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: const DrawerWidget(),
      child: GestureDetector(
        onTap: () {
          _advancedDrawerController.hideDrawer();
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(20, 20),
            child: Container(),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      _advancedDrawerController.showDrawer();
                    },
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          ImageConstant.menuImages,
                          height: 35,
                          width: 35,
                        )),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorConstant.primaryColor),
                            shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(30),
                            child: Image.network(
                              ImageConstant.userImages,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppConstant.welcome,
                            style: TextStyle(
                              color: ColorConstant.greyColor,
                                fontFamily:
                                    FontFamilyConstant.fontFamilyRegular,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            AppConstant.name,
                            style: TextStyle(
                                fontFamily:
                                    FontFamilyConstant.fontFamilyRegular,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: ColorConstant.primaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 16),
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              AppConstant.bannerName,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily:
                                      FontFamilyConstant.fontFamilyRegular,
                                  fontWeight: FontWeight.w700,
                                  color: ColorConstant.secondaryColor),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    fixedSize: WidgetStateProperty.all<Size>(
                                      const Size(120.0,
                                          0.0), // Button width and height
                                    ),
                                    elevation: WidgetStateProperty.all(3),
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                            ColorConstant.secondaryColor),
                                    shape: WidgetStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ))),
                                child: const Text(AppConstant.bookNow,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        height: 200,
                        ImageConstant.momImages,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(AppConstant.yourBooking,
                      style: TextStyle(
                          color: ColorConstant.secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  const Divider(),
                  (homeWatch.isLoading ?? false)
                      ? const CupertinoActivityIndicator(
                          color: ColorConstant.primaryColor,
                        )
                      : homeWatch.currentBookingData.isNotEmpty
                          ? CurrentBookingWidget(
                              bookingData: homeWatch.currentBookingData.first)
                          : const SizedBox.shrink(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(AppConstant.package,
                      style: TextStyle(
                          color: ColorConstant.secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  const SizedBox(
                    height: 20,
                  ),
                  (homeWatch.isLoading ?? false)
                      ? const CupertinoActivityIndicator(
                          color: ColorConstant.primaryColor,
                        )
                      : PackagesListWidget(packagesList: homeWatch.packageList),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
