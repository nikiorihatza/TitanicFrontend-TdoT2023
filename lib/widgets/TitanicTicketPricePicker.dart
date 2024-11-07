import 'package:flutter/material.dart';

class TitanicTicketPricePicker extends StatefulWidget {
  double _ticketPrice = 20;


  double get ticketPrice => _ticketPrice;

  @override
  State<TitanicTicketPricePicker> createState() => _TitanicTicketPricePickerState();
}

class _TitanicTicketPricePickerState extends State<TitanicTicketPricePicker> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: Color(0xFF9CCE2B),
      value: widget._ticketPrice,
      max: 80,
      divisions: 250,
      label: widget._ticketPrice.toStringAsFixed(2),
      onChanged: (double value) {
        setState(() {
          widget._ticketPrice = value;
        });
      },
    );
  }
}
