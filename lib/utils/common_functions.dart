import 'package:flutter/cupertino.dart';

Widget widthSpace(double widthSpace) {
  return SizedBox(
    width: widthSpace,
  );
}

Widget heightSpace(double heightSpace) {
  return SizedBox(
    height: heightSpace,
  );
}

String notNullString(any) {
  return any == null ? '' : any.toString();
}
