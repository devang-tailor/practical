import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:practicaldevang/infrasturcture/constants/api_constant.dart';
import 'package:practicaldevang/infrasturcture/models/current_booking_response_model.dart';
import 'package:practicaldevang/infrasturcture/models/package_list_response_model.dart';

class HomeProvider extends ChangeNotifier {
  List<PackageData> get packageList => _packageList;
  List<PackageData> _packageList = [];

  List<CurrentBookingData> get currentBookingData => _currentBookingData;
  List<CurrentBookingData> _currentBookingData = [];

  bool? get isLoading => _isLoading;
  bool? _isLoading = false;

  void changeLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchPackageDataApi() async {
    changeLoading(true);

    final response = await http.get(
        Uri.parse(ApiConstant.packageList));

    changeLoading(false);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      PackageListResponseModel responseModel =
          PackageListResponseModel.fromJson(
              jsonDecode(response.body) as Map<String, dynamic>);

      if (responseModel.response != null) {
        _packageList.addAll(responseModel.response ?? []);
        notifyListeners();
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }

  Future<void> currentBookingApi() async {
    changeLoading(true);

    final response = await http.get(Uri.parse(ApiConstant.bookingList));

    changeLoading(false);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      CurrentBookingResponseModel responseModel =
          CurrentBookingResponseModel.fromJson(
              jsonDecode(response.body) as Map<String, dynamic>);

      if (responseModel.response != null) {
        _currentBookingData.addAll(responseModel.response ?? []);
        notifyListeners();
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
