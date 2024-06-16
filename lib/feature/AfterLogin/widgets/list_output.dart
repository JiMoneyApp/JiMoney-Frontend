import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/ApiServices/fetchdata.dart';
import 'package:jimoney_frontend/ApiServices/fetchuser.dart';
import 'package:jimoney_frontend/DataBase/ledger.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';

class ListOutput extends StatefulWidget {
  const ListOutput({super.key});

  @override
  State<ListOutput> createState() => _ListOutputState();
}

class _ListOutputState extends State<ListOutput> {
  final UserInfo userInfo = GetIt.instance<UserInfo>();

  int? userId;
  Future<void> _fetchUserId() async {
    final UserService userService = GetIt.instance<UserService>();
    try {
      userId =
          await userService.fetchUserId(userInfo.username, userInfo.password);
      print("userID = " + userId.toString());
      // userId;
      // Now you can use the userId as needed
    } catch (e) {
      print("Error fetching user ID: $e");
      // return null;
    }
  }

  Future<void> _fetchDatas() async {
    //print("ERRORCHECCK1");
    final DataService dataService = GetIt.instance<DataService>();
    print("ERRORCHECKKLL2");
    try {
      if (userId == null) {
        await _fetchUserId();
      }
      setState(() {
        userInfo.ledgerResponse = [];
      });

      userInfo.ledgerResponse =
          (await dataService.fetchDatas(userId!, userInfo.selectedledger))!;

      _sum();

      print(userInfo.ledgerResponse);
      // userId
      // Now you can use the userId as needed
    } catch (e) {
      print("Error fetching ledger: $e");
      // return null;
    }
  }

  @override
  void initState() {
    super.initState();
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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Container(
  //       width: double.maxFinite,
  //       decoration: BoxDecoration(
  //           shape: BoxShape.rectangle,
  //           borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(20), topRight: Radius.circular(20)),
  //           border: Border.all(color: Colors.grey)),
  //       child: ListView.builder(
  //         itemCount: ledgerResponse.length,
  //         itemBuilder: (context, index) {
  //           return Container(
  //             color: Color(0XFFFFD9D9),
  //             child: ListTile(
  //               leading: CircleAvatar(
  //                 child: Icon(Icons.account_balance_wallet),
  //               ),
  //               title: Text(ledgerResponse[index].dname ?? 'No Name'),
  //               subtitle: Text(ledgerResponse[index].ddate ?? 'No Date'),
  //               trailing:
  //                   Text(ledgerResponse[index].price.toString() ?? 'No Amount'),
  //               onTap: () {
  //                 print('You tapped on ${ledgerResponse[index].dname}');
  //               },
  //             ),
  //           );
  //         },
  //         scrollDirection: Axis.vertical,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<void>(
          future: _fetchDatas(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Ledger> ledgerList = userInfo.ledgerResponse;
              return Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    border: Border.all(color: Colors.grey)),
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
                            ledgerList[index].price.toString() ?? 'No Amount'),
                        onTap: () {
                          print('You tapped on ${ledgerList[index].dname}');
                        },
                      ),
                    );
                  },
                  scrollDirection: Axis.vertical,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
