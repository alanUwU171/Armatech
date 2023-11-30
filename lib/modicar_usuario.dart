import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ModificarUsuarioPage extends StatefulWidget {
  final String email; // Pasar el email del usuario a través del constructor

  ModificarUsuarioPage({required this.email});

  @override
  _ModificarUsuarioPageState createState() => _ModificarUsuarioPageState();
}

class _ModificarUsuarioPageState extends State<ModificarUsuarioPage> {
  final TextEditingController _nombresController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nombresController,
              decoration: InputDecoration(labelText: 'Nombres'),
            ),
            TextField(
              controller: _apellidosController,
              decoration: InputDecoration(labelText: 'Apellidos'),
            ),
            TextField(
              controller: _direccionController,
              decoration: InputDecoration(labelText: 'Dirección'),
            ),
            TextField(
              controller: _telefonoController,
              decoration: InputDecoration(labelText: 'Teléfono'),
            ),
            TextField(
              controller: _contrasenaController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _modificarUsuario(
                  widget.email,
                  _nombresController.text,
                  _apellidosController.text,
                  _direccionController.text,
                  _telefonoController.text,
                  _contrasenaController.text,
                );
                Navigator.pop(context, _nombresController.text);
              },
              child: Text('Modificar Usuario'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _modificarUsuario(
    String email,
    String nombres,
    String apellidos,
    String direccion,
    String telefono,
    String password,
  ) async {
    final url = Uri.parse('http://localhost/armatech/perfil.php');

    final response = await http.post(
      url,
      body: {
        'nombres': nombres,
        'apellidos': apellidos,
        'email': email,
        'direccion': direccion,
        'telefono': telefono,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print(responseData['message']); // Mensaje del servidor

      // Mostrar mensaje de modificación exitosa
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Modificación exitosa'),
        ),
      );

      // Regresar a la página de inicio después de la modificación
      Navigator.pop(context);
    } else {
      print('Error en la solicitud HTTP');
    }
  }
}
