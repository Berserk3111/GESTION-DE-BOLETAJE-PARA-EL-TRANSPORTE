import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class card_vertical extends StatefulWidget {
  const card_vertical({data});

  @override
  State<card_vertical> createState() => _card_verticalState();
}

class _card_verticalState extends State<card_vertical> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: const SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text('Outlined Card')),
        ));
  }
}
