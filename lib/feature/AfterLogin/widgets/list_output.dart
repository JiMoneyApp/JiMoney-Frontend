import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/ApiServices/fetchdata.dart';
import 'package:jimoney_frontend/DataBase/ledger.dart';
import 'package:jimoney_frontend/feature/bloc/bloc/data_bloc.dart';
import 'package:jimoney_frontend/feature/bloc/ledger_bloc.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';

class ListOutput extends StatefulWidget {
  const ListOutput({super.key});

  @override
  State<ListOutput> createState() => _ListOutputState();
}

class _ListOutputState extends State<ListOutput> {
  final UserInfo userInfo = GetIt.instance<UserInfo>();

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
      //print(fetchedData);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                List<Ledger> ledgerList = userInfo.ledgerResponse;
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
                      return Card(
                        color: Color(0XFFFFD9D9),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.account_balance_wallet),
                          ),
                          title: Text(ledgerList[index].dname ?? 'No Name'),
                          subtitle: Text(ledgerList[index].ddate ?? 'No Date'),
                          trailing: Text(
                              '\$${ledgerList[index].price?.toString() ?? 'No Amount'}'),
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
