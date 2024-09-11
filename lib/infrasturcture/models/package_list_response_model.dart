class PackageListResponseModel {
  String? code;
  String? status;
  String? message;
  List<PackageData>? response;

  PackageListResponseModel(
      {this.code, this.status, this.message, this.response});

  PackageListResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['response'] != null) {
      response = <PackageData>[];
      json['response'].forEach((v) {
        response?.add(PackageData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PackageData {
  String? title;
  String? price;
  String? desc;

  PackageData({this.title, this.price, this.desc});

  PackageData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['price'] = price;
    data['desc'] = desc;
    return data;
  }
}
