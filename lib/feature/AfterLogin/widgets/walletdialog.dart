import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/ledgerdialog.dart';
import 'package:jimoney_frontend/feature/common/ledger.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';
import 'package:jimoney_frontend/feature/common/wallet.dart';

class WalletDialog extends StatelessWidget {
  final Function(Wallet) onCategorySelected;
  WalletDialog({required this.onCategorySelected});

  void _showLedgerDialog(BuildContext context, String walletName) {
    showDialog(
      context: context,
      builder: (context) {
        return LedgerDialog(onLedgerSelected: (ledger) {
          print('Selected ledger: $ledger');

          Navigator.pop(context); // Close the LedgerDialog
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final UserInfo userInfo = GetIt.instance<UserInfo>();
    final LedgerByWallet ledgerByWallet = GetIt.instance<LedgerByWallet>();

    return AlertDialog(
      title: Text('Select a Wallet'),
      content: Container(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: userInfo.wallet.length,
          itemBuilder: (context, index) {
            final wallet = userInfo.wallet[index];
            return ListTile(
              leading: Icon(Icons.wallet),
              title: Text(wallet.name),
              onTap: () {
                onCategorySelected(wallet);
                _showLedgerDialog(context, wallet.name);
                userInfo.inputedWallet = wallet.name;
                ledgerByWallet.wid = wallet.id;
              },
            );
          },
        ),
      ),
    );
  }
}
