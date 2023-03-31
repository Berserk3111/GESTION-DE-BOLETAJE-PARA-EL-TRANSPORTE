import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/NavBar/pages/configuracion.dart';
import 'package:gbs_oax/pages/NavBar/pages/favoritos.dart';
import 'package:gbs_oax/pages/NavBar/pages/home.dart';
import 'package:gbs_oax/pages/NavBar/pages/misBoletos.dart';
import 'package:gbs_oax/pages/NavBar/pages/perfil.dart';

class Navbar extends StatefulWidget {
  @override
  State<Navbar> createState() => _NavbarState();
}

final items = <Widget>[
  const Icon(Icons.home, size: 40),
  const Icon(Icons.search_rounded, size: 40),
  const Icon(Icons.local_shipping, size: 30),
  const Icon(Icons.person, size: 40)
];

final paginas = [Home(), MisBoletos(), Favoritos(), Perfil(), Configuracion()];

//Aqui creas tu navbar
//El navbar llama a todas las paginas principales
class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: paginas[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge_outlined),
            label: 'Mis Boletos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car_outlined),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Configuracion',
          )
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
