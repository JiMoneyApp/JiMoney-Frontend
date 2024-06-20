class Datas {
  int? uid;
  int? did;
  int? price;
  String? dname;
  String? dtype;
  String? ddate;
  Datas({
    required this.uid,
    required this.did,
    required this.price,
    required this.dname,
    required this.ddate,
    required this.dtype,
  });

  factory Datas.fromJson(Map<String, dynamic> json) {
    return Datas(
      uid: json['UID'],
      did: json['DID'],
      price: json['Price'] is int
          ? json['Price']
          : int.tryParse(json['Price'] ?? '0'),
      dname: json['DName'],
      dtype: json['DType'],
      ddate: json['DDate'],
    );
  }
}

class Data {
  int? id;
  String? title;
  int? cost;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.title, this.cost, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    cost = json['cost'] is int
        ? json['cost']
        : int.tryParse(json['cost'] ?? '0'); // 处理 cost 字段
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['cost'] = this.cost;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
