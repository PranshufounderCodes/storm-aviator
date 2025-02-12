class ShowQrModel {
  dynamic message;
  dynamic status;
  List<Data>? data;

  ShowQrModel({this.message, this.status, this.data});

  ShowQrModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic id;
  dynamic name;
  dynamic qrCode;
  dynamic walletAddress;
  dynamic type;
  dynamic createdAt;
  dynamic updatedAt;

  Data(
      {this.id,
        this.name,
        this.qrCode,
        this.walletAddress,
        this.type,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    qrCode = json['qr_code'];
    walletAddress = json['wallet_address'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['qr_code'] = qrCode;
    data['wallet_address'] = walletAddress;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}