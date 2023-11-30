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
      title: 'Tarjetas madre',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Tarjetas_madre(),
    );
  }
}

class Tarjetas_madre extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Tarjeta Madre (MoBo) Chipset Intel H410',
      description:
          'Soporta: Intel 10ma Gen, Socket 1200, 2xDDR4 (64GB Max), Audio HD, Red, USB 3.2 y SATA 3.0, ATX, PCIEx16',
      price: 1599.99,
      image: 'assets/tarjeta1.jpg',
    ),
    Product(
      name: 'B75-S placa base de computadora PCI-E 16X/1X placa',
      description:
          '0*3 Interfaz de alimentación: 4 pines*1, 24 pines*1 Zócalo de CPU: compatible con procesador LGA1155 Interfaz PS/2: interfaz de ratón y teclado PS/2 Interfaz USB: USB3.0*4, USB2.0*6 (USB3 frontal .0*2, USB2.0*2)',
      price: 1319.99,
      image: 'assets/tarjeta2.jpg',
    ),
    Product(
      name: 'TARJETA MADRE ASROCK H510M-HVS R2.0 SOC 1200 10',
      description: '',
      price: 1000.99,
      image: 'assets/tarjeta3.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarjetas Madre'),
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
