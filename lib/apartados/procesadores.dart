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
      home: ProcesadoresPage(),
    );
  }
}

class Producto {
  final String imagen;
  final String nombre;
  final String descripcion;
  final double precio;

  Producto({
    required this.imagen,
    required this.nombre,
    required this.descripcion,
    required this.precio,
  });
}

class ProcesadoresPage extends StatelessWidget {
  final List<Producto> procesadores = [
    Producto(
      imagen: 'assets/procesador1.jpg',
      nombre: 'Intel Core i7-10700K',
      descripcion: 'Procesador de 8 núcleos y 16 hilos',
      precio: 7850.0,
    ),
    Producto(
      imagen: 'assets/procesador2.jpg',
      nombre: 'AMD Ryzen 5 5600X',
      descripcion: 'Procesador de 6 núcleos y 12 hilos',
      precio: 2500.0,
    ),
    Producto(
      imagen: 'assets/procesador3.jpg',
      nombre: 'Intel Core i9-14900KK',
      descripcion: 'Procesador de 24 núcleos y 48 hilos',
      precio: 11865.0,
    ),
    Producto(
      imagen: 'assets/procesador4.jpg',
      nombre: 'AMD Ryzen 9 5600X',
      descripcion: 'Procesador de 12 núcleos y 24 hilos, graficos Radeon',
      precio: 299.0,
    ),
    Producto(
      imagen: 'assets/procesador5.jpg',
      nombre: 'Intel Core i5-13400F',
      descripcion:
          'Procesador de 6 + 4(núcleos electrónicos) núcleos y 12 hilos',
      precio: 299.0,
    ),
    // Agrega más procesadores según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Procesadores'),
      ),
      body: ListView.builder(
        itemCount: procesadores.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(
                procesadores[index].imagen,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              title: Text(procesadores[index].nombre),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(procesadores[index].descripcion),
                  Text('\$${procesadores[index].precio.toString()}'),
                ],
              ),
              onTap: () {
                // Agrega la lógica para manejar el tap en un producto específico
                // Puedes navegar a una nueva página para ver más detalles, etc.
              },
            ),
          );
        },
      ),
    );
  }
}
