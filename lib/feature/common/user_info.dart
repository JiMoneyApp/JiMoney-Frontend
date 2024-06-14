import 'package:jimoney_frontend/DataBase/ledger.dart';
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
  List<Ledger> ledgerResponse;
  int sum;

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
    required this.ledgerResponse,
    required this.sum,
  });
}
