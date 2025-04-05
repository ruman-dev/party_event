import 'package:flutter/material.dart';
import 'package:party_event/core/global_widget/custom_appbar.dart';
import 'package:party_event/core/global_widget/custom_pdf_screen.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Voucher', isTrailingEnabled: false),
      body: CustomPdfScreen(
        isTimeBasedEvent: false,
        eventTitle: 'International Band Music Concert 2022',
        eventTime: '03:24 Hr',
        eventVenue: 'October 25, 2022',
        eventSeatOrCost: '\$15.USD',
        eventBarCode: '1234567890',
        eventDate: 'October 25, 2022',
      ),
    );
  }
}
