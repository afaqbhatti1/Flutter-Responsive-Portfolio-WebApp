import 'package:flutter/material.dart';

import '../../../../res/constants/constants.dart';

class AreaInfoText extends StatelessWidget {
  const AreaInfoText(
      {super.key,
      required this.title,
      required this.text,
      required this.onTap});
  final String title;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
