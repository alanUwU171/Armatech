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
      home: MemoriasRAMPage(),
    );
  }
}

class MemoriaRAM {
  final String image;
  final String nombre;
  final String descripcion;
  final double precio;

  MemoriaRAM({
    required this.image,
    required this.nombre,
    required this.descripcion,
    required this.precio,
  });
}

class MemoriasRAMPage extends StatelessWidget {
  final List<MemoriaRAM> memoriasRAMList = [
    MemoriaRAM(
      image: 'assets/ram.jpg',
      nombre: 'Memoria RAM DDR2 4GB 800MHz 240PIN',
      descripcion: '',
      precio: 360.0,
    ),
    MemoriaRAM(
      image: 'assets/ram2.jpg',
      nombre: 'Memoria Ram Kingston DDR3 8GB 1600MHz',
      descripcion: '',
      precio: 250.0,
    ),
    MemoriaRAM(
      image: 'assets/ram4.jpg',
      nombre: 'Memoria Ram Kingston Ddr4 8gb 2666mhz',
      descripcion: '',
      precio: 300.0,
    ),
    MemoriaRAM(
      image: 'assets/ram4.jpg',
      nombre: 'Memoria Sodimm DDR4 Kingston 16GB 2666MHZ',
      descripcion: '',
      precio: 500.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memorias RAM'),
      ),
      body: ListView.builder(
        itemCount: memoriasRAMList.length,
        itemBuilder: (context, index) {
          return MemoriaRAMItem(memoriaRAM: memoriasRAMList[index]);
        },
      ),
    );
  }
}

class MemoriaRAMItem extends StatelessWidget {
  final MemoriaRAM memoriaRAM;

  MemoriaRAMItem({required this.memoriaRAM});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 150, // Ajusta la altura según tus necesidades
            child: Image.asset(
              memoriaRAM.image,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text(memoriaRAM.nombre),
            subtitle: Text(memoriaRAM.descripcion),
            trailing: Text('\$${memoriaRAM.precio.toString()}'),
          ),
        ],
      ),
    );
  }
}
