class GetAllChapter {
  bool? success;
  String? message;
  List<Data>? data;

  GetAllChapter({this.success, this.message, this.data});

  GetAllChapter.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? sId;
  String? name;
  int? iV;

  Data({this.sId, this.name, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['chapter'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['chapter'] = name;
    data['__v'] = iV;
    return data;
  }
}
