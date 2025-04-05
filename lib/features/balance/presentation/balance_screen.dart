import 'package:flutter/material.dart';
import 'package:party_event/core/global_widget/custom_appbar.dart';
import 'package:party_event/core/utils/asset_path.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payment',
        isTrailingEnabled: true,
        iconPath: AssetPath.scannerIcon,
      ),
    );
  }
}
