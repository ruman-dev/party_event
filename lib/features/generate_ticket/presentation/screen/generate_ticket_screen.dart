import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:party_event/core/global_widget/custom_appbar.dart';
import 'package:party_event/core/global_widget/custom_pdf_screen.dart';

class GenerateTicketScreen extends StatelessWidget {
  const GenerateTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ticket', isTrailingEnabled: false),
      body: CustomPdfScreen(
        isTimeBasedEvent: false,
        eventTitle: 'International Band Music Concert 2022',
        eventDate: 'October 25, 2022',
        eventTime: '10:00 PM',
        eventVenue: 'October 25, 2022',
        eventSeatOrCost: '05',
        eventBarCode: '1234567890',
      ),
    );
  }
}
