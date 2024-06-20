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
// class Datas {
//   String? ddate;
//   int? did;
//   String? dname;
//   String? dtype;
//   String? lname;
//   int? price;
//   int? uid;

//   Datas(
//       {this.ddate,
//       this.did,
//       this.dname,
//       this.dtype,
//       this.lname,
//       this.price,
//       this.uid});

//   Datas.fromJson(Map<String, dynamic> json) {
//     ddate = json['ddate'];
//     did = json['did'];
//     dname = json['dname'];
//     dtype = json['dtype'];
//     lname = json['lname'];
//     price = json['price'] is int
//         ? json['price']
//         : int.tryParse(json['price'] ?? '0'); // 处理 price 字段
//     uid = json['uid'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ddate'] = this.ddate;
//     data['did'] = this.did;
//     data['dname'] = this.dname;
//     data['dtype'] = this.dtype;
//     data['lname'] = this.lname;
//     data['price'] = this.price;
//     data['uid'] = this.uid;
//     return data;
//   }
// }

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
