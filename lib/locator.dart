import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/ApiServices/fetchledger.dart';
import 'package:jimoney_frontend/ApiServices/fetchuser.dart';
import 'package:jimoney_frontend/ApiServices/fetchwallet.dart';
import 'package:jimoney_frontend/ApiServices/updatedata.dart';
import 'package:jimoney_frontend/ApiServices/updateuser.dart';
import 'package:jimoney_frontend/ApiServices/updateledger.dart';
import 'package:jimoney_frontend/ApiServices/fetchdata.dart';
import 'package:jimoney_frontend/authentication/Login/bloc/login_bloc.dart';
import 'package:jimoney_frontend/authentication/Register/bloc/register_bloc.dart';
import 'package:jimoney_frontend/feature/common/categories.dart';
import 'package:jimoney_frontend/feature/common/ledger.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';
import 'package:jimoney_frontend/feature/common/wallet.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.allowReassignment = true;
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton<UserInfo>(() => UserInfo(
        username: '',
        nickname: '',
        password: '',
        rightHanded: true,
        budget: 0,
        isdark: false,
        noticetime: '',
        ledger: [],
        selectedledger: '',
        ledgerResponse: [],
        sum: 0,
        uid: null,
      ));
  locator.registerLazySingleton(() => UserUpdateService());
  locator.registerFactory(() => RegisterBloc());
  locator.registerFactory(() => LoginBloc());
  locator.registerLazySingleton(() => LedgerService());
  locator.registerLazySingleton(() => LedgerUpdateService());
  locator.registerLazySingleton(() => DataService());
  locator.registerLazySingleton(() => DataUpdateService());
  locator.registerLazySingleton(() => WalletService());
  locator.registerLazySingleton(() => Wallet(
        id: 0,
        name: "Default Wallet",
      ));
  locator.registerLazySingleton(() => Ledger(
        id: 0,
        name: "Default Ledger",
      ));
  locator.registerLazySingleton(() => LedgerByWallet(
        wid: 0,
        lid: 0,
        name: "Default Ledger",
      ));
}
