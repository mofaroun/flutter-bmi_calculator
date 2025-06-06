import 'package:flutter/material.dart';
import 'constants.dart';

class GenderSelection extends StatelessWidget {
  const GenderSelection(
      {super.key, required this.gender, required this.genderIcon});

  final String gender;
  final IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(gender, style: ktextSTyle),
      ],
    );
  }
}
