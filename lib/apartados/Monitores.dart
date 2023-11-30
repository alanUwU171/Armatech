import 'package:flutter/material.dart';

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
      home: MonitoresPage(),
    );
  }
}

class MonitoresPage extends StatelessWidget {
  final List<Producto> productos = [
    Producto(
      nombre: 'LG 27GQ50F ',
      descripcion:
          'Pantalla 27” Full HD (1920 x 1080) 165Hz Refresh Rate 1ms MBR.',
      precio: 4399.99,
      imagen: 'assets/monitor1.jpg',
    ),
    Producto(
      nombre: 'Monitor Gamer JVC SI32G ',
      descripcion:
          'A través de su pantalla LED de 32 pulgadas con resolución FHD de 1920 x 1080 píxeles, te sumergirás en imágenes claras y vibrantes mientras juegas tus videojuegos favoritos o aprovechas al máximo del contenido multimedia de tu preferencia..',
      precio: 4999.99,
      imagen: 'assets/monitor2.jpg',
    ),
    Producto(
      nombre: 'Monitor Pc Gamer 23.8',
      descripcion: '144 Hz Display Port Hdmi Usb 30w .',
      precio: 2555.99,
      imagen: 'assets/monitor3.jpg',
    ),
    Producto(
      nombre: 'Monitor Samsung WQHD',
      descripcion:
          'Su diseño minimalista te encantará, ya que cuenta con una pantalla sin borde en 3 lados, ofreciéndote una vista más amplia. Además, en él puedes tener el campo de visión de dos monitores, sin el inconveniente de las divisiones en medio, y si deseas puedes conectar dos dispositivos distintos para verlos en la misma pantalla. MODO EYE SAVER.',
      precio: 359.99,
      imagen: 'assets/monitor4.jpg',
    ),
    Producto(
      nombre: 'Monitor gamer 27 balam rush ultra odyssey',
      descripcion: '',
      precio: 3199.99,
      imagen: 'assets/monitor5.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitores'),
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(productos[index].nombre),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 4,
                    ),
                    child: Image.asset(
                      productos[index].imagen,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(productos[index].descripcion),
                  Text('\$${productos[index].precio.toString()}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Producto {
  final String nombre;
  final String descripcion;
  final double precio;
  final String imagen;

  Producto({
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.imagen,
  });
}
