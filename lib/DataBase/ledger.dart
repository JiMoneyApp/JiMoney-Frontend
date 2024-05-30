class ledger {
  String? ddate;
  int? did;
  String? dname;
  String? dtype;
  String? lname;
  int? price;
  int? uid;

  ledger(
      {this.ddate,
      this.did,
      this.dname,
      this.dtype,
      this.lname,
      this.price,
      this.uid});

  ledger.fromJson(Map<String, dynamic> json) {
    ddate = json['ddate'];
    did = json['did'];
    dname = json['dname'];
    dtype = json['dtype'];
    lname = json['lname'];
    price = json['price'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ddate'] = this.ddate;
    data['did'] = this.did;
    data['dname'] = this.dname;
    data['dtype'] = this.dtype;
    data['lname'] = this.lname;
    data['price'] = this.price;
    data['uid'] = this.uid;
    return data;
  }
}