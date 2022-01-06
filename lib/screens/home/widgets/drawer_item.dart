import 'package:flutter/material.dart';
import 'package:instalment/utils/colors.dart';
import 'package:instalment/utils/common_functions.dart';

class DrawerItem extends StatelessWidget {
  String iconPath;
  String title;

  DrawerItem(this.iconPath, this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              widthSpace(8),
              Image.asset(
                iconPath,
                  width: 36
              ),
              widthSpace(16),
              Text(
                title,
                style: TextStyle(
                    color: primaryDarkColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Card(
            shadowColor: primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24)),
            elevation: 16,
            child: Image.asset(
              'assets/icons/ic_drawer_arrow.png',
              width: 36,
            ),
          ),
        ],
      ),
    );
  }
}
