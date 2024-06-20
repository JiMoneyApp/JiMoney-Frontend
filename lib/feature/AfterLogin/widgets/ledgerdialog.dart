import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/feature/common/ledger.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';

class LedgerDialog extends StatelessWidget {
  final Function(Ledger) onLedgerSelected;
  LedgerDialog({required this.onLedgerSelected});

  @override
  Widget build(BuildContext context) {
    final LedgerByWallet ledgerByWallet = GetIt.instance<LedgerByWallet>();
    final UserInfo userInfo = GetIt.instance<UserInfo>();

    return AlertDialog(
      title: Text('Select a Ledger'),
      content: Container(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: userInfo.ledger.length,
          itemBuilder: (context, index) {
            final ledger = userInfo.ledger[index];
            return ListTile(
              leading: Icon(Icons.book),
              title: Text(ledger.name),
              onTap: () {
                onLedgerSelected(ledger);
                userInfo.inputedLedger = ledger.name;
                ledgerByWallet.lid = ledger.id;
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
    );
  }
}
