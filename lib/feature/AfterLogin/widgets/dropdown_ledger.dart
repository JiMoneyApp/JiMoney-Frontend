import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/ApiServices/fetchledger.dart';
import 'package:jimoney_frontend/ApiServices/updateledger.dart';
import 'package:jimoney_frontend/feature/bloc/ledger_bloc.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';

class LedgerSelector extends StatefulWidget {
  const LedgerSelector({super.key});

  @override
  State<LedgerSelector> createState() => _LedgerSelectorState();
}

class _LedgerSelectorState extends State<LedgerSelector> {
  final UserInfo userInfo = GetIt.instance<UserInfo>();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchLedger();
  }

  Future<void> _fetchLedger() async {
    setState(() {
      isLoading = true;
    });
    final ledgerService = GetIt.instance<LedgerService>();
    try {
      userInfo.ledger = (await ledgerService.fetchLedgersName(userInfo.uid!))!;
      if (userInfo.ledger.isNotEmpty) {
        context.read<LedgerBloc>().add(LedgerSelectedEvent(userInfo.ledger[0]));
      }
      print("selected Ledger = " + userInfo.selectedledger);
    } catch (e) {
      print("Error fetching ledger: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _insertLedger(String ledgerName) async {
    final ledgerService = GetIt.instance<LedgerUpdateService>();
    try {
      await ledgerService.insertLedger(userInfo.uid!, ledgerName);
      BlocProvider.of<LedgerBloc>(context).add(LedgerAddedEvent());
      print("Inserting ledger: $ledgerName");
    } catch (e) {
      print("Error inserting ledger: $e");
    }
  }

  Future<void> _deleteLedger(String ledgerName) async {
    final ledgerService = GetIt.instance<LedgerUpdateService>();
    try {
      await ledgerService.deleteLedger(userInfo.uid!, ledgerName);
      BlocProvider.of<LedgerBloc>(context).add(LedgerDeletedEvent(ledgerName));
      print("Deleting ledger: $ledgerName");
    } catch (e) {
      print("Error deleting ledger: $e");
    }
  }

  void _showAddLedgerDialog(BuildContext context) {
    final TextEditingController _ledgerController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Ledger'),
          content: TextFormField(
            controller: _ledgerController,
            decoration: InputDecoration(hintText: 'Enter ledger name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ledger name cannot be empty';
              }
              return null;
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (_ledgerController.text.isNotEmpty) {
                  _insertLedger(_ledgerController.text);
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _confirmDelete(String ledgerName) async {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete $ledgerName?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  BlocProvider.of<LedgerBloc>(context)
                      .add(LedgerDeletedEvent(ledgerName));
                  _deleteLedger(ledgerName);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onLedgerChanged(String? newLedger) {
    if (newLedger == 'add_new') {
      _showAddLedgerDialog(context);
    } else {
      BlocProvider.of<LedgerBloc>(context).add(LedgerSelectedEvent(newLedger!));
    }
    print("Switched to ledger: $newLedger");
    print("The new ledger is: ${userInfo.selectedledger}");
  }

  void _showLedgerSelectorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialog_context) {
        return BlocProvider<LedgerBloc>.value(
          value: context.read<LedgerBloc>(),
          child: AlertDialog(
            title: Text('Select Ledger'),
            content: BlocBuilder<LedgerBloc, LedgerState>(
              builder: (context, state) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: state is LedgerInitial
                        ? userInfo.selectedledger = userInfo.ledger[0]
                        : userInfo.selectedledger,
                    hint: Text('Select Ledger'),
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    underline: SizedBox(),
                    dropdownColor: Colors.white,
                    onChanged: _onLedgerChanged,
                    items: [
                      ...userInfo.ledger.map((String ledger) {
                        return DropdownMenuItem<String>(
                          value: ledger,
                          child: InkWell(
                            onLongPress: () {
                              print("OnLongPress");
                              _confirmDelete(ledger);
                            },
                            child: Text(ledger),
                          ),
                        );
                      }).toList(),
                      DropdownMenuItem<String>(
                        value: 'add_new',
                        child: Text(
                          'Add New Ledger',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchLedger();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<LedgerBloc, LedgerState>(
        builder: (context, state) {
          return ElevatedButton(
              onPressed: () {
                _showLedgerSelectorDialog(context);
              },
              child: Text(
                '${userInfo.selectedledger}',
                style: TextStyle(color: Colors.black),
              ));
        },
      ),
    );
  }
}
