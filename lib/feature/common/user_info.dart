class UserInfo {
  String username;
  String nickname;
  String password;
  bool rightHanded = true;
  int budget;
  bool isdark = false;
  String noticetime = "";
  List<String> ledger = [];
  String selectedledger = "";

  UserInfo({
    required this.username,
    required this.nickname,
    required this.password,
    required this.rightHanded,
    required this.budget,
    required this.isdark,
    required this.noticetime,
    required this.ledger,
    required this.selectedledger,
  });
}
