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
