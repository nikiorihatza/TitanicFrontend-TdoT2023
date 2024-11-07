import 'package:dsai_titanic/internals/TextUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['1', '2', '3'];

class TitanicPassengerDropdown extends StatefulWidget {
  String _dropdownValue = list.last;


  int get dropdownValue => int.parse(_dropdownValue);

  @override
  State<TitanicPassengerDropdown> createState() =>
      _TitanicPassengerDropdownState();
}

class _TitanicPassengerDropdownState extends State<TitanicPassengerDropdown> {

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      textStyle: TextUtils.menuFieldStyle,
      enableFilter: false,
      width: 200,
      label: Text(
        'Passgierklasse',
        style: TextUtils.menuFieldStyle,
      ),
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          widget._dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
