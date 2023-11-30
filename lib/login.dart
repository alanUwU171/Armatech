import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'registro.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _nombres = ''; // Variable de clase para almacenar el nombre de usuario
  Future<void> _login(String email, String password) async {
    final url = Uri.parse(
        'http://localhost/armatech/login.php'); // Reemplaza con la URL correcta de tu servidor y archivo PHP

    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['message'] == 'Inicio de sesión exitoso') {
        // Autenticación exitosa
        setState(() {
          _nombres = responseData['nombres'];
        });
        print('Inicio de sesión exitoso');
        print('Nombre de usuario: $_nombres');
      } else {
        // Credenciales incorrectas
        print('Credenciales incorrectas');
      }
    } else {
      // Error en la solicitud HTTP
      print('Error en la solicitud HTTP');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image.asset('assets/logo.jpg',
                width: 100,
                height:
                    100), // Ajusta el ancho y alto seg%C3%BAn tus necesidades
            SizedBox(width: 10), // Espacio entre el logo y el titulo
            Text(
                'Inicio de sesion Armatech'), // T%C3%ADtulo de la aplicaci%C3%B3n
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 61, 30, 66),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseñaa'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _login(_emailController.text, _passwordController.text);

                // Ahora, al hacer pop, pasamos el nombre de usuario en lugar del correo electrónico
                Navigator.pop(context,
                    {'email': _emailController.text, 'nombres': _nombres});
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 182, 81, 180),
              ),
              child: Text('Iniciar sesión'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar a la página de registro (reemplaza 'RegistroPage' con el nombre de tu página de registro)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistroPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(
                    255, 182, 81, 180), // Cambia el color del botón
              ),
              child: Text("¿No te has registrado? Presiona aquí"),
            ),
            _nombres.isNotEmpty
                ? Text(
                    'Bienvenido, $_nombres',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
