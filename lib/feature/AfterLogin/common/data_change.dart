Future<void> _fetchDatas() async {
  //print("ERRORCHECCK1");
  final DataService dataService = GetIt.instance<DataService>();
  print("ERRORCHECKKLL2");
  print("userid:" + userInfo.uid.toString());
  print("userselectedledger:" + userInfo.selectedledger.toString());
  try {
    setState(() {
      userInfo.ledgerResponse = [];
    });
    // userInfo.ledgerResponse = (await dataService.fetchDatas(
    //     userInfo.uid!, userInfo.selectedledger))!;
    // BlocProvider.of<DataBloc>(context).add(DataFetchedEvent());
    // _sum();
    var fetchedData =
        await dataService.fetchDatas(userInfo.uid!, userInfo.selectedledger);

    if (fetchedData != null && fetchedData.isNotEmpty) {
      setState(() {
        userInfo.ledgerResponse = fetchedData;
      });

      BlocProvider.of<DataBloc>(context).add(DataFetchedEvent());
    } else {
      print("No data fetched or empty data received.");
    }
    print("LedgerResponse");
    print(userInfo.ledgerResponse);
    // userId
    // Now you can use the userId as needed
  } catch (e) {
    print("Errorrrrr fetching ledger: $e");
    // return null;
  }
}
