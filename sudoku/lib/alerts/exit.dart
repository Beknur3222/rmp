import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';
import '../styles.dart';

class AlertExit extends StatelessWidget {
  const AlertExit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Styles.secondaryBackgroundColor,
      title: Text(
        'Выход из игры',
        style: TextStyle(color: Styles.foregroundColor),
      ),
      content: Text(
        'Вы точно хотите выйти ?',
        style: TextStyle(color: Styles.foregroundColor),
      ),
      actions: [
        TextButton(
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all<Color>(Styles.primaryColor)),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Нет'),
        ),
        TextButton(
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all<Color>(Styles.primaryColor)),
          onPressed: () {
            if (HomePageState.isDesktop) {
              exit(0);
            } else if (HomePageState.platform == 'android') {
              SystemNavigator.pop();
            }
          },
          child: const Text('Да'),
        ),
      ],
    );
  }
}
