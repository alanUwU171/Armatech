import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Product {
  final String name;
  final String description;
  final double price;
  final String image;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarjetas Gráficas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Tarjetas_m(),
    );
  }
}

class Tarjetas_m extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'NVIDIA GeForce RTX 3080',
      description: 'Potente tarjeta gráfica para juegos',
      price: 7146.99,
      image: 'assets/rtx3080.jpg',
    ),
    Product(
      name: 'AMD Radeon RX 6800 XT',
      description: 'Tarjeta gráfica de alto rendimiento para entusiastas',
      price: 15469.99,
      image: 'assets/rx6800xt.jpg',
    ),
    Product(
      name: 'NVIDIA GeForce GTX 1660 Super',
      description: 'Excelente rendimiento para juegos a 1080p',
      price: 239.99,
      image: 'assets/gtx1660super.jpg',
    ),
    Product(
      name: 'AMD Radeon RX 5700 XT',
      description: 'Rendimiento de juego de gama alta',
      price: 399.99,
      image: 'assets/rx5700xt.jpg',
    ),
    Product(
      name: 'NVIDIA GeForce RTX 3060',
      description: 'Rendimiento sólido a un precio asequible',
      price: 329.99,
      image: 'assets/rtx3060.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarjetas Gráficas'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.all(16.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              leading: Image.asset(
                product.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              title: Text(product.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.description),
                  SizedBox(height: 8),
                  Text('\$${product.price.toString()}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
