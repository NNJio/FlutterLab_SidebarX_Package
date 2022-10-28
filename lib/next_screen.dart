import 'package:flutter/material.dart';

import 'home_screen.dart';

class SecondLevelItem1Page extends StatelessWidget {
  const SecondLevelItem1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: '/secondLevelItem1',
      body: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Second Level Item 1',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}
