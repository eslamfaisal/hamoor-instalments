import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

Widget titleText(String header) {
  return Text(
    header,
    style: TextStyle(
        fontSize: 24, color: darkBlueColor, fontWeight: FontWeight.w500),
  );
}

Widget descriptionText(String description, {double size = 16}) {
  return Text(
    description,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: size,
      color: primaryColor,
      fontWeight: FontWeight.w500,
    ),
  );
}
