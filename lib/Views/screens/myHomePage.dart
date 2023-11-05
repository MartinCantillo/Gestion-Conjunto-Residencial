import 'package:flutter/material.dart';
import 'package:gestionresidencial/Views/Widgets/drawer.dart';
import 'package:gestionresidencial/localstore/sharepreference.dart';

class myHomePage extends StatefulWidget {
  const myHomePage({Key? key});

  static const String nombre = 'myHomePage';

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  //bool _colorsecundario = false;
  final prefs = PrefernciaUsuario();

  @override
  void initState() {
    super.initState();
   // _colorsecundario = prefs.colosecundario;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: prefs.colosecundario ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text('Bienvenido',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Text(
          'Contenido de la página principal',
          style: TextStyle(
              color: prefs.colosecundario ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}