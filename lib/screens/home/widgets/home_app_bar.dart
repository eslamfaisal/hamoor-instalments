import 'package:flutter/material.dart';
import 'package:instalment/utils/colors.dart';
import 'package:instalment/utils/common_functions.dart';
import 'package:instalment/utils/extensions.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryLight,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 36,
                  height: 36,
                  child: Image.asset(
                    'assets/icons/ic_menu.png',
                  ).onTap(() {
                    Scaffold.of(context).openDrawer();
                  }),
                ),
                widthSpace(8),
                const Text(
                  'مكتبتي',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Image.asset('assets/icons/ic_notification.png'),
                widthSpace(16),
                Image.asset('assets/icons/ic_qibla.png'),
                widthSpace(8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
