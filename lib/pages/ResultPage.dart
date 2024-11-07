import 'package:dsai_titanic/internals/ProbabilityArgument.dart';
import 'package:dsai_titanic/internals/TextUtils.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as ProbabilityArgument;
    double surival = arguments.probablity;
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Deine Chance auf der Titanic zu überleben ist:',
                style: TextUtils.headlineTxtStyle,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(200, 50, 200, 50),
                child: Slider(
                  value: surival,
                  onChanged: null,
                  min: 0,
                  max: 100,
                  activeColor: Color(0xFF9CCE2B),
                  thumbColor: Color(0xFF9CCE2B),
                  inactiveColor: Color(0xFF9CCE2B),
                ),
              ),
              Text('$surival %', style: TextUtils.headlineTxtStyle,)
            ],
          )),
    );
  }
}
