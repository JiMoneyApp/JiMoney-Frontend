import 'package:jimoney_frontend/DataBase/datas.dart';
import 'package:jimoney_frontend/feature/common/ledger.dart';

class UserInfo {
  String username;
  String nickname;
  String password;
  bool rightHanded = true;
  int budget;
  bool isdark = false;
  String noticetime = "";
  List<Ledger> ledger = [];
  String selectedledger = "";
  List<Datas> ledgerResponse;
  int sum;
  int? uid;

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
    required this.uid,
  });
}
