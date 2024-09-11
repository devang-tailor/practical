class CurrentBookingResponseModel {
  String? code;
  String? status;
  String? message;
  List<CurrentBookingData>? response;

  CurrentBookingResponseModel(
      {this.code, this.status, this.message, this.response});

  CurrentBookingResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['response'] != null) {
      response = <CurrentBookingData>[];
      json['response'].forEach((v) {
        response!.add(CurrentBookingData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (response != null) {
      data['response'] = response?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrentBookingData {
  String? title;
  String? fromDate;
  String? fromTime;
  String? toDate;
  String? toTime;

  CurrentBookingData(
      {this.title, this.fromDate, this.fromTime, this.toDate, this.toTime});

  CurrentBookingData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    fromDate = json['from_date'];
    fromTime = json['from_time'];
    toDate = json['to_date'];
    toTime = json['to_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['from_date'] = fromDate;
    data['from_time'] = fromTime;
    data['to_date'] = toDate;
    data['to_time'] = toTime;
    return data;
  }
}
