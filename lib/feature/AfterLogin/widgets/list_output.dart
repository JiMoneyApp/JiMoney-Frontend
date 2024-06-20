import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:jimoney_frontend/ApiServices/fetchdata.dart';
import 'package:jimoney_frontend/ApiServices/fetchwallet.dart';
import 'package:jimoney_frontend/DataBase/datas.dart';
import 'package:jimoney_frontend/feature/bloc/bloc/data_bloc.dart';
import 'package:jimoney_frontend/feature/bloc/ledger_bloc.dart';
import 'package:jimoney_frontend/feature/common/categories.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';

class ListOutput extends StatefulWidget {
  const ListOutput({super.key});

  @override
  State<ListOutput> createState() => _ListOutputState();
}

class _ListOutputState extends State<ListOutput> {
  final UserInfo userInfo = GetIt.instance<UserInfo>();

  Future<void> _fetchwallets() async {
    final WalletService walletService = GetIt.instance<WalletService>();
    try {
      userInfo.wallet = (await walletService.fetchAllWallets(userInfo.uid!));
      print("${userInfo.wallet}");
    } catch (e) {
      print("Error fetching wallet: $e");
    }
  }

  Future<void> _fetchDatas() async {
    //print("ERRORCHECCK1");
    final DataService dataService = GetIt.instance<DataService>();
    print("ERRORCHECKKLL2");
    print("userid:" + userInfo.uid.toString());
    print("userselectedledger:" + userInfo.selectedledger.toString());
    try {
      userInfo.ledgerResponse = [];

      // userInfo.ledgerResponse = (await dataService.fetchDatas(
      //     userInfo.uid!, userInfo.selectedledger))!;
      // BlocProvider.of<DataBloc>(context).add(DataFetchedEvent());
      // _sum();
      var fetchedData = await dataService.fetchDatas(userInfo.uid!);
      userInfo.ledgerResponse = fetchedData!;
      // BlocProvider.of<DataBloc>(context).add(DataFetchedEvent());
      // if (fetchedData != null && fetchedData.isNotEmpty) {
      //   userInfo.ledgerResponse = fetchedData;

      //   BlocProvider.of<DataBloc>(context).add(DataFetchedEvent());
      _sum();
      // } else {
      //   print("No data fetched or empty data received.");
      // }
      print("LEDGERResponse");
      print(fetchedData);
      print("UL");
      print(userInfo.ledgerResponse);
      // userId
      // Now you can use the userId as needed
    } catch (e) {
      print("Errorrrrr fetching ledger: $e");
      // return null;
    }
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DataBloc>(context).add(DataBeginEvent());
    _fetchDatas();
    _fetchwallets();
  }

  @override
  void didChangeDependencies() {
    _fetchDatas();
    super.didChangeDependencies();
  }

  void _sum() {
    int sum = 0;
    for (int i = 0; i < userInfo.ledgerResponse.length; i++) {
      sum += userInfo.ledgerResponse[i].price!.toInt();
    }
    userInfo.sum = sum;
    print(sum);
  }

  void sortLedgerList() {
    setState(() {
      userInfo.ledgerResponse.sort((a, b) {
        if (userInfo.isSortedByNewestFirst) {
          return b.ddate!.compareTo(a.ddate!);
        } else {
          return a.ddate!.compareTo(b.ddate!);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(36),
        child: AppBar(
          title: Text("$formattedDate"),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: IconButton(
                icon: Icon(userInfo.isSortedByNewestFirst
                    ? Icons.arrow_downward
                    : Icons.arrow_upward),
                onPressed: () {
                  setState(() {
                    userInfo.isSortedByNewestFirst =
                        !userInfo.isSortedByNewestFirst;
                  });
                  sortLedgerList();
                },
                iconSize: 30,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: MultiBlocListener(
          listeners: [
            BlocListener<DataBloc, DataState>(
              listener: (context, state) async {
                print("DSTATE: " + state.toString());
                if (state is DataBeginState || state is DataInsertState) {
                  print("Data AWAIT FETCH DATAS");

                  await _fetchDatas();
                  print("Fetched Datas");
                  BlocProvider.of<DataBloc>(context).add(DataFetchedEvent());
                }
              },
            ),
            BlocListener<LedgerBloc, LedgerState>(
              listener: (context, state) async {
                print("LSTATE: " + state.toString());
                if (state is LedgerInitial || state is LedgerSelectedState) {
                  print("Ledger AWAIT FETCH DATAS");
                  await _fetchDatas();
                  BlocProvider.of<DataBloc>(context).add(DataFetchedEvent());
                }
              },
            ),
          ],
          child: BlocBuilder<DataBloc, DataState>(
            builder: (context, state) {
              print("State: " + state.toString());
              if (state is DataFetchedState) {
                List<Datas> ledgerList = userInfo.ledgerResponse;
                print("LEDGER");
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: ListView.builder(
                    itemCount: ledgerList.length,
                    itemBuilder: (context, index) {
                      final category = ledgerList[index].dtype;
                      print("category: ");
                      print(category);
                      final categoryItem = CategoryItem.fromName(category!);
                      // DateFormat originalFormat = DateFormat('yyyyMMdd');
                      // DateFormat newFormat = DateFormat('yyyy-MM-dd');
                      // DateTime dateTime =
                      //     DateTime.parse(ledgerList[index].ddate!);
                      // String cardformattedDate = newFormat.format(
                      //     originalFormat.parse(ledgerList[index].ddate!));
                      return Card(
                        color: (category == "薪水" || category == "投資")
                            ? Colors.green
                            : Color(0XFFFFD9D9),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(categoryItem.icon),
                          ),
                          title: Text(ledgerList[index].dname ?? 'No Name'),
                          subtitle: Text(ledgerList[index].ddate ?? 'No Date'),
                          trailing: Text(
                            '\$${ledgerList[index].price?.toString() ?? 'No Amount'}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            print('You tapped on ${ledgerList[index].dname}');
                          },
                        ),
                      );
                    },
                    scrollDirection: Axis.vertical,
                  ),
                );
              } else {
                return Container(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
