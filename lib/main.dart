import 'package:ensamble/apartados/Gabinetes.dart';
import 'package:ensamble/apartados/Monitores.dart';
import 'package:ensamble/apartados/Tarjetas_madre.dart';
import 'package:ensamble/apartados/endambladas.dart';
import 'package:ensamble/apartados/ram.dart';
import 'package:ensamble/aviso.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'modicar_usuario.dart';
import 'package:ensamble/apartados/procesadores.dart';
import 'package:ensamble/apartados/Tarjetas Gráficas.dart';

void main() => runApp(EnsambleApp());

class EnsambleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Armatech',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 61, 30, 66),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 61, 30, 66),
        ),
      ),
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  String _nombres = '';
  String _email = '';

  // Restablecer el estado de _nombres al cerrar sesión
  void _cerrarSesion() {
    setState(() {
      _nombres = '';
      _email = '';
    });
  }

  final List<String> images = [
    'assets/img1.jpg',
    'assets/img2.jpg',
    'assets/img3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image.asset('assets/logo.jpg', width: 100, height: 70),
            SizedBox(
              width: 10,
              height: 15,
            ),
            Text('Armatech'),
          ],
        ),
        actions: <Widget>[
          if (_nombres.isEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  // Navegar a la página de inicio de sesión y esperar el resultado
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );

                  // Verifica si result no es nulo y si es un mapa (correo electrónico y nombres)
                  if (result != null && result is Map<String, dynamic>) {
                    // Extraer los valores del mapa y actualizar el estado
                    setState(() {
                      _email = result['email'];
                      _nombres = result['nombres'];
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Iniciar Sesión'),
                ),
              ),
            ),
          if (_nombres.isNotEmpty)
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                // Lógica para cerrar sesión
                _cerrarSesion();
              },
            ),
          if (_nombres.isNotEmpty)
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Navegar a la página de información del usuario
                // Puedes crear tu propia página o reemplazar con la página correspondiente
                // Pasar el nombre de usuario como argumento si es necesario
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ModificarUsuarioPage(email: _email),
                  ),
                );
              },
            ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Lógica para navegar a la página del carrito de compras
              // Puedes usar Navigator.push como en el botón de iniciar sesión
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            if (_nombres.isNotEmpty)
              GestureDetector(
                onTap: () {
                  // Navegar a la página de información del usuario
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ModificarUsuarioPage(email: _email),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Bienvenido, $_nombres',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(
                          255, 248, 6, 240), // Color del hipervínculo
                    ),
                  ),
                ),
              )
            else
              Container(),
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/logo.jpg', width: 50, height: 50),
                  SizedBox(height: 10),
                  Text(
                    'Armatech',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Procesadores'),
              onTap: () {
                // Navegar a la página de procesadores
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProcesadoresPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Tarjetas Gráficas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Tarjetas_m(),
                  ),
                );
                // Lógica para navegar a la página de Tarjetas Gráficas
              },
            ),
            ListTile(
              title: Text('Gabinetes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(),
                  ),
                );
                // Lógica para navegar a la página de Procesadores
                // Puedes usar Navigator.push como en el botón de iniciar sesión
              },
            ),
            ListTile(
              title: Text('Monitores'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MonitoresPage(),
                  ),
                );
                // Lógica para navegar a la página de Tarjetas Gráficas
              },
            ),
            ListTile(
              title: Text('Tarjetas madre'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Tarjetas_madre(),
                  ),
                );
                // Lógica para navegar a la página de Procesadores
                // Puedes usar Navigator.push como en el botón de iniciar sesión
              },
            ),
            ListTile(
              title: Text('Memorias RAM'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemoriasRAMPage(),
                  ),
                );
                // Lógica para navegar a la página de Tarjetas Gráficas
              },
            ),
            ListTile(
              title: Text('Ensambladas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PcEnsambladasPage(),
                  ),
                );
                // Lógica para navegar a la página de Procesadores
                // Puedes usar Navigator.push como en el botón de iniciar sesión
              },
            ),
            // Agrega más opciones según sea necesario
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
            items: images.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Text(
            '¡Bienvenido a Armatech!',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Text(
            'Misión de Armatech:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Facilitar la creación de experiencias informáticas personalizadas al proporcionar una plataforma intuitiva y completa para el ensamblaje de computadoras, empoderando a los usuarios con opciones de hardware de calidad y conocimientos técnicos accesibles.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'Visión de Armatech:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Ser la primera elección global para entusiastas y profesionales que buscan construir computadoras personalizadas, liderando el camino en innovación, sostenibilidad y educación tecnológica, para inspirar una comunidad conectada y empoderada a través del ensamblaje de equipos.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AvisoPrivacidadPage(),
                ),
              );
            },
            child: Text(
              'Aviso de Privacidad',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context)
                    .primaryColor, // Puedes ajustar el color según tu tema
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfoPage extends StatelessWidget {
  final String nombres;

  UserInfoPage({required this.nombres});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información del Usuario'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nombre de Usuario: $nombres',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Agregar más información del usuario según sea necesario
          ],
        ),
      ),
    );
  }
}
