import 'package:flutter/material.dart';
import 'package:gbs_oax/providers/corridas_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    final corridasProvider = Provider.of<CorridasProvider>(context);

    return Scaffold(
      body: Center(child: Text("Aqui va el home, lo mismo con las demas paginas del navbar")),
    );
  }
}
