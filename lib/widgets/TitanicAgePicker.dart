import 'package:flutter/material.dart';

class TitanicAgePicker extends StatefulWidget {
  double _age = 20;


  int get age => _age.toInt();

  @override
  State<TitanicAgePicker> createState() => _TitanicAgePickerState();
}

class _TitanicAgePickerState extends State<TitanicAgePicker> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: Color(0xFF9CCE2B),
      value: widget._age,
      max: 80,
      divisions: 80,
      label: widget._age.round().toString(),
      onChanged: (double value) {
        setState(() {
          widget._age = value;
        });
      },
    );
  }
}
