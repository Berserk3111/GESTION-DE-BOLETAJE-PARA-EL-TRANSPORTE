import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  @override
  State<Navbar> createState() => _NavbarState();
}

//Aqui creas tu navbar
//El navbar llama a todas las paginas principales
class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Navbar")),
    );
  }
}
