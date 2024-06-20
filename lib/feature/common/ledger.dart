class Ledger {
  final int id;
  final String name;

  Ledger({required this.id, required this.name});

  factory Ledger.fromJson(Map<String, dynamic> json) {
    return Ledger(
      id: json['LID'],
      name: json['LName'],
    );
  }
}

class LedgerByWallet {
  int lid;
  int wid;
  String name;

  LedgerByWallet({required this.lid, required this.wid, required this.name});

  factory LedgerByWallet.fromJson(Map<String, dynamic> json) {
    return LedgerByWallet(
      lid: json['LID'],
      wid: json['WID'],
      name: json['LName'],
    );
  }
}
