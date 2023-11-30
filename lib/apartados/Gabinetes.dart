import 'package:flutter/material.dart';

void main() => runApp(EnsambleApp());

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

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
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Gabinete Gamer Pro',
      description: 'Diseñado para jugadores exigentes',
      price: 5031.99,
      imageUrl: 'assets/gabinete1.jpg',
    ),
    Product(
      name: 'Gabinete RGB Supreme',
      description: 'Con iluminación RGB personalizable',
      price: 2504.99,
      imageUrl: 'assets/gabinete2.jpg',
    ),
    Product(
      name: 'Gabinete Elegance X',
      description: 'Estilo elegante y espacio para múltiples componentes',
      price: 3985.99,
      imageUrl: 'assets/gabinete3.jpg',
    ),
    Product(
      name: 'Gabinete Evangelion',
      description: 'Sistema de ventilación avanzado para un rendimiento óptimo',
      price: 4000.99,
      imageUrl: 'assets/gabinete4.jpg',
    ),
    Product(
      name: 'Gabinete SilentForce',
      description:
          'Operación silenciosa para una experiencia sin distracciones',
      price: 1250.99,
      imageUrl: 'assets/gabinete5.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos - Gabinetes'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio:
                4 / 3, // Modificar el aspectRatio según tus preferencias
            child: Image.asset(
              product.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 8.0),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
