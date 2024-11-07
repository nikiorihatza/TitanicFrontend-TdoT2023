import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:toggle_switch/toggle_switch.dart';

class TitanicGenderToggle extends StatelessWidget {
  var _indexOfGender = 0;

  var _listOfGenders = ['Männlich', 'Weiblich'];

  String returnGender() {
    return _listOfGenders[_indexOfGender];
  }

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 100.0,
      initialLabelIndex: 1,
      cornerRadius: 20.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      labels: _listOfGenders,
      icons: [Icons.male, Icons.female],
      activeBgColors: [
        [Color(0xFF9CCE2B)],
        [Color(0xFF9CCE2B)]
      ],
      onToggle: (index) {
        _indexOfGender = index!;
      },
    );
  }
}
