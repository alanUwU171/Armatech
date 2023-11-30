import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'login.dart';

class RegistroPage extends StatelessWidget {
  final TextEditingController _nombresController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro en Armatech'),
        backgroundColor: const Color.fromARGB(255, 61, 30, 66),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _registrarUsuario(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 182, 81, 180),
              ),
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }

  void _registrarUsuario(BuildContext context) async {
    String nombres = _nombresController.text;
    String apellidos = _apellidosController.text;
    String direccion = _direccionController.text;
    String telefono = _telefonoController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // Validar que los campos obligatorios no estén en blanco
    if (nombres.isEmpty ||
        apellidos.isEmpty ||
        direccion.isEmpty ||
        telefono.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      _mostrarMensajeError(context, 'Todos los campos son obligatorios');
      return;
    }

    // Validación del correo electrónico
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      // Muestra un mensaje de error si el correo electrónico no es válido
      _mostrarMensajeError(context, 'Correo electrónico no válido');
      return;
    }

    // Validación de proveedores de correo electrónico específicos (opcional)
    if (!email.endsWith('@hotmail.com') &&
        !email.endsWith('@yahoo.com') &&
        !email.endsWith('@gmail.com') &&
        !email.endsWith('@live.com') &&
        !email.endsWith('@live.com.mx') &&
        !email.endsWith('@outlook.com')) {
      _mostrarMensajeError(context, 'Proveedor de correo no compatible');
      return;
    }

    // Validación del teléfono
    if (!_esTelefonoValido(telefono)) {
      _mostrarMensajeError(context,
          'Teléfono no válido. Debe contener solo números y tener una longitud de 10 dígitos');
      return;
    }

    final url = Uri.parse('http://localhost/armatech/register.php');

    try {
      final response = await http.post(url, body: {
        'nombres': nombres,
        'apellidos': apellidos,
        'direccion': direccion,
        'telefono': telefono,
        'email': email,
        'password': password,
      });

      // Manejar la respuesta del servidor según sea necesario
      if (response.statusCode == 200) {
        // Éxito
        _mostrarRegistroExitoso(context);
      } else {
        // Error en el servidor
        _mostrarMensajeError(context, 'Error en el registro');
      }
    } catch (error) {
      // Error de conexión
      _mostrarMensajeError(context, 'Error de conexión');
    }
  }

  bool _esTelefonoValido(String telefono) {
    // Utilizar una expresión regular para validar que el teléfono contiene solo números
    RegExp regex = RegExp(r'^[0-9]+$');

    // Validar que la longitud del teléfono sea de 10 dígitos
    return regex.hasMatch(telefono) && telefono.length == 10;
  }

  void _mostrarMensaje(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(mensaje),
    ));
  }

  void _mostrarMensajeError(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarRegistroExitoso(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registro Exitoso'),
          content: Text('Tu registro fue exitoso'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
                // Navegar a la página de inicio de sesión
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
