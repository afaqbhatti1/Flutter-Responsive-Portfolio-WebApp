import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/utils/app_functions.dart';

import '../../../../res/constants/constants.dart';
import 'header_info.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({super.key});

  final appFunctions = AppFunctions.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: defaultPadding / 2,
        ),
        AreaInfoText(
          title: 'Contact',
          text: '+923160006212',
          onTap: () {
            appFunctions.openDialer('+923160006212');
          },
        ),
        AreaInfoText(
          title: 'Email',
          text: 'afaqbhatti0@gmail.com',
          onTap: () {
            appFunctions.openEmailApp('afaqbhatti0@gmail.com');
          },
        ),
        AreaInfoText(
          title: 'WhatsApp',
          text: '+923160006212',
          onTap: () {
            appFunctions.openWhatsApp(context, '+923160006212');
          },
        ),
        AreaInfoText(
            title: 'LinkedIn',
            text: '@afaqarshad',
            onTap: () {
              appFunctions
                  .openWebUrl('https://www.linkedin.com/in/afaqarshad/');
            }),
        AreaInfoText(
            title: 'Github',
            text: '@afaqbhatti1',
            onTap: () {
              appFunctions.openWebUrl('https://github.com/afaqbhatti1');
            }),
        const SizedBox(
          height: defaultPadding,
        ),
        const Text(
          'Skills',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }
}
