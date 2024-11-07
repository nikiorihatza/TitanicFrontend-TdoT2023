import 'package:dsai_titanic/widgets/CustomPadding.dart';
import 'package:flutter/cupertino.dart';

class TripleCustomPadding extends StatelessWidget {
  const TripleCustomPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPadding(),
        CustomPadding(),
        CustomPadding(),
      ],
    );
  }
}
