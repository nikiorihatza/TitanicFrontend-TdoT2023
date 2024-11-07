import 'package:dsai_titanic/internals/ProbabilityArgument.dart';
import 'package:dsai_titanic/internals/TextUtils.dart';
import 'package:dsai_titanic/widgets/CustomPadding.dart';
import 'package:dsai_titanic/widgets/TitanicAgePicker.dart';
import 'package:dsai_titanic/widgets/TitanicGenderToggle.dart';
import 'package:dsai_titanic/widgets/TitanicPassengerDropdown.dart';
import 'package:dsai_titanic/widgets/TitanicTicketPricePicker.dart';
import 'package:dsai_titanic/widgets/TripleCustomPadding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as converter;

class TitanticDataFormPage extends StatelessWidget {
  var _classDropDown = TitanicPassengerDropdown();
  var _genderToggle = TitanicGenderToggle();
  var _agePicker = TitanicAgePicker();
  var _ticketPricePicker = TitanicTicketPricePicker();

  void getProbabilityAndSwitchPage(BuildContext context) async {
    var passengerClass = _classDropDown.dropdownValue;
    var gender = _genderToggle.returnGender();
    var age = _agePicker.age;
    var price = _ticketPricePicker.ticketPrice;
    var url = Uri.http('172.20.10.3:88', 'persons/');

    if (gender == 'Weiblich') {
      gender = 'female';
    } else {
      gender = 'male';
    }


    Map<String, dynamic> jsonData = {
      "Pclass": passengerClass,
      "Age": age,
      "Sex": gender,
      "Fare": price,
      "SibSp": 2,
      "Parch": 2,
      "Embarked": "C"
    };

    var jsonEncoded = converter.jsonEncode(jsonData);
    var response = await http.post(url, headers: {'Content-Type': 'application/json'}, body: jsonEncoded);
    
    Map<String, dynamic> jsonDecoded = converter.jsonDecode(response.body);
    double survivalValue = jsonDecoded['survival'] * 100;
    survivalValue = double.parse(survivalValue.toStringAsFixed(2));

    Navigator.of(context).pushNamed('/result', arguments: ProbabilityArgument(survivalValue!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TripleCustomPadding(),
              Text(
                'Wie hoch ist deine Überlebenschance auf der Titanic?',
                style: TextUtils.headlineTxtStyle,
              ),
              TripleCustomPadding(),
              Image.asset(
                "lib/images/titanic.png",
                scale: 1.3,
              ),
              TripleCustomPadding(),
              _classDropDown,
              TripleCustomPadding(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Geschlecht     ', style: TextUtils.txtFieldStyle),
                _genderToggle
              ]),
              TripleCustomPadding(),
              Text(
                'Alter',
                style: TextUtils.txtFieldStyle,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(200, 0, 200, 50),
                child: _agePicker,
              ),
              Text(
                'Ticketpreis',
                style: TextUtils.txtFieldStyle,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(200, 0, 200, 50),
                child: _ticketPricePicker,
              ),
              CustomPadding(),
              CupertinoButton(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF9CCE2B)),
                    child: Text('Wahrscheinlichkeit berechnen',
                        style: TextUtils.txtFieldStyle),
                  ),
                  onPressed: () => getProbabilityAndSwitchPage(context))
            ],
          ),
        ),
      ),
    );
  }
}
