import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/login.dart';
import 'package:gbs_oax/providers/login_provider.dart';
import 'package:gbs_oax/providers/registro_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => LoginProvider(),
            lazy: false,
          ),
          ChangeNotifierProvider(
            create: (_) => RegistroProvider(),
            lazy: false,
          )
          //lazi: constructor del provider cuando se inicialice
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner:
              false, //liston de desarrollo para que no lo muestre
          title: 'GBS OAX',
          routes: {
            'login': (_) => Login(),
          },
          initialRoute: 'login',
        ));
  }
}
