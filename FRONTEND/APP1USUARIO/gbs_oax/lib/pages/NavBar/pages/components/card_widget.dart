import 'package:flutter/material.dart';

class card_vertical extends StatefulWidget {
  const card_vertical({data});

  @override
  State<card_vertical> createState() => _card_verticalState();
}

class _card_verticalState extends State<card_vertical> {
  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.hardEdge,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: InkWell(
            splashColor: Colors.amber.withAlpha(30),
            onTap: () {
              debugPrint('card pulsada');
            },
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Center(child: Text('Outlined Card')),
            )));
  }
}
