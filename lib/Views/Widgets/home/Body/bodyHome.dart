import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gestionresidencial/Views/Components/mybutton2_component.dart';
import 'package:gestionresidencial/Views/Widgets/home/waveClipper/ShapeClipperAppBar.dart';
import 'package:gestionresidencial/Views/screens/Historial/historial_screen.dart';

class BodyHome extends ConsumerWidget {
  const BodyHome({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.4,
                    child: ClipPath(
                      clipper: ShapeClipperAppBar(),
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        height: MediaQuery.of(context).size.height * 0.3,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: ShapeClipperAppBar(),
                    child: Container(
                      color: Theme.of(context).primaryColor,
                      height: MediaQuery.of(context).size.height * 0.28,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
         Positioned(
          bottom: MediaQuery.of(context).size.height * 0.45,
          left: 10,
          right: 0,
          child: Row(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Text("MAR", style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor)),
                    Card(
                      elevation: 10, // Espacio entre la hora y el día
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(children: [
                            Text("11", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                            const Text("Lunes", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100)),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: buildCardNotification(),
              ),
            ],
          ),
        ), 
        Positioned(
          bottom: 0,
          left: 10,
          right: 10,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Mis Reportes',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  MyButton2(
                    title: 'Ver todos',
                    onTap: () {
                      Navigator.of(context).pushNamed(HistorialPage.nombre);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child:  ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const Card(
                    child: ListTile(
                      title: Text('Asunto'),
                      trailing: Text('Pendiente'),
                    ),
                  );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCardNotification() {
    return const Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'AdminName',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  'Hora',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Mantenimiento del Lobby',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Lorem ipsum dolor',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
