import 'package:flutter/material.dart';
import 'dart:io';

import 'package:gestionresidencial/Views/Components/mybutton_component.dart';
import 'package:gestionresidencial/Views/Components/mytextfield_component.dart';
import 'package:gestionresidencial/Views/screens/Historial/historial_screen.dart';

import 'package:gestionresidencial/localstore/sharepreference.dart';
import 'package:image_picker/image_picker.dart';

class Report {
  final String type;
  final String subject;
  final String description;
  final List<File> evidences;

  Report({
    required this.type,
    required this.subject,
    required this.description,
    required this.evidences,
  });
}

// ignore: camel_case_types
class reporte extends StatefulWidget {
  
  const reporte({super.key});

  static const String nombre = 'reporte';

  @override

  State<reporte> createState() => _reporteState();
}


// ignore: camel_case_types
class _reporteState extends State<reporte> {
  final typeController = TextEditingController();
  final subjectController = TextEditingController();
  final descriptionController = TextEditingController();
  final List<File> _evidences = [];
  
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _evidences.add(File(pickedFile.path));
      });
    }
  }
  
  final prefs = PrefernciaUsuario();
  
  @override
  void initState() {
    super.initState();

  }
  void _submitReport() {
    // Aquí podemos manejar la lógica para enviar el reporte
    // Podemos acceder a los valores a través de typeController.text, subjectController.text, descriptionController.text
    // y las imágenes en _evidences

    List<Report> reports = [
      Report(
        type: typeController.text,
        subject: subjectController.text,
        description: descriptionController.text,
        evidences: _evidences,
      ),
    ];

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HistorialPage(reports: reports)),
    );
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text(
            'Formulario Reporte',
            textAlign: TextAlign.center,
          ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
          }, 
          icon: const Icon(Icons.arrow_back_outlined),
        ),
  ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            MyTextField(
                controller: typeController,
                hintText: 'Tipo',
                obscureText: false,
                maxLines: 1,
              ),
            const SizedBox(height: 16.0),
            MyTextField(
                controller: subjectController,
                hintText: 'Asunto',
                obscureText: false,
                maxLines: 1,
            ),
            const SizedBox(height: 16.0),
            MyTextField(
                controller: descriptionController,
                hintText: 'Descripcion',
                obscureText: false,
                maxLines: 5,
            ),
            const SizedBox(height: 16.0),
            Container(
              height: 100,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8)
              ),
                child: ElevatedButton(
                  onPressed: _pickImage,
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle( 
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  child: const Text('Subir Evidencias'),
                ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _evidences.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(_evidences[index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            MyButton(
              onTap: _submitReport,
              title: "Enviar Reporte"
            ),
          ],
        ),
      ),
    );
  }
}