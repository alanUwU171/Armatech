import 'package:flutter/material.dart';

void main() => runApp(EnsambladasApp());

class EnsambladasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PCs Ensambladas',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PcEnsambladasPage(),
    );
  }
}

class PcEnsambladasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PCs Ensambladas'),
      ),
      body: ListView(
        children: <Widget>[
          for (int i = 1; i <= 1; i++)
            PcEnsambladaItem(
              nombre: 'Computadora Gamer Yeyian Yari X21 $i',
              descripcion:
                  'Intel Core i9-12900KF 3.20GHz, 32GB, 2TB HDD + 2TB SSD, NVIDIA GeForce RTX 3080, Windows 11 Home 64-bit $i',
              mediosAlmacenaje: 'SSD',
              factorFormatoSSD: 'M.2',
              unidadAlmacenamiento: 'SSD',
              interfazSSD: 'PCI Express 4.0',
              capacidadTotalAlmacenaje: '4000 GB',
              numUnidadesSSD: 1,
              capacidadTotalSSD: '2000 GB',
              capacidad: '4000 GB',
              numPuertosUSB2: 2,
              numPuertosEthernet: 1,
              puertoSPDIF: true,
              salidaLinea: true,
              entradaLinea: true,
              numPuertosUSB31: 1,
              numPuertosHDMI: 1,
              puertoRatonPS2: 1,
              numDisplayPorts: 1,
              numPuertosUSB32Gen2x2C: 1,
              numPuertosUSB30: 2,
              tipoMemoria: 'DDR5-SDRAM',
              memoriaInterna: '32 GB',
              velocidadMemoria: '4800 MHz',
              canalesMemoria: 'Dual-channel',
              precio: 68999.99 * i,
              imagenUrl: 'assets/ensamble1.jpg',
            ),
        ],
      ),
    );
  }
}

class PcEnsambladaItem extends StatelessWidget {
  final String nombre;
  final String descripcion;
  final String mediosAlmacenaje;
  final String factorFormatoSSD;
  final String unidadAlmacenamiento;
  final String interfazSSD;
  final String capacidadTotalAlmacenaje;
  final int numUnidadesSSD;
  final String capacidadTotalSSD;
  final String capacidad;
  final int numPuertosUSB2;
  final int numPuertosEthernet;
  final bool puertoSPDIF;
  final bool salidaLinea;
  final bool entradaLinea;
  final int numPuertosUSB31;
  final int numPuertosHDMI;
  final int puertoRatonPS2;
  final int numDisplayPorts;
  final int numPuertosUSB32Gen2x2C;
  final int numPuertosUSB30;
  final String tipoMemoria;
  final String memoriaInterna;
  final String velocidadMemoria;
  final String canalesMemoria; // Agregué este campo
  final double precio;
  final String imagenUrl;

  PcEnsambladaItem({
    required this.nombre,
    required this.descripcion,
    required this.mediosAlmacenaje,
    required this.factorFormatoSSD,
    required this.unidadAlmacenamiento,
    required this.interfazSSD,
    required this.capacidadTotalAlmacenaje,
    required this.numUnidadesSSD,
    required this.capacidadTotalSSD,
    required this.capacidad,
    required this.numPuertosUSB2,
    required this.numPuertosEthernet,
    required this.puertoSPDIF,
    required this.salidaLinea,
    required this.entradaLinea,
    required this.numPuertosUSB31,
    required this.numPuertosHDMI,
    required this.puertoRatonPS2,
    required this.numDisplayPorts,
    required this.numPuertosUSB32Gen2x2C,
    required this.numPuertosUSB30,
    required this.tipoMemoria,
    required this.memoriaInterna,
    required this.velocidadMemoria,
    required this.canalesMemoria,
    required this.precio,
    required this.imagenUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 4 / 1,
              child: Image.asset(
                imagenUrl,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    descripcion,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Medios de Almacenaje: $mediosAlmacenaje',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Factor de Formato SSD: $factorFormatoSSD',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Unidad de Almacenamiento: $unidadAlmacenamiento',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Interfaz SSD: $interfazSSD',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Capacidad Total de Almacenaje: $capacidadTotalAlmacenaje',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Número de Unidades SSD Instalados: $numUnidadesSSD',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Capacidad Total SSD: $capacidadTotalSSD',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Capacidad: $capacidad',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Puertos e Interfaces:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Cantidad de Puertos USB 2.0: $numPuertosUSB2',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Ethernet LAN (RJ-45) Cantidad de Puertos: $numPuertosEthernet',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Puerto de Salida S/PDIF: ${puertoSPDIF ? "Sí" : "No"}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Salida de Línea: ${salidaLinea ? "Sí" : "No"}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Entrada de Línea: ${entradaLinea ? "Sí" : "No"}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Cantidad de Puertos tipo A USB 3.1 (Gen 2): $numPuertosUSB31',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Número de Puertos HDMI: $numPuertosHDMI',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Puerto de Ratón PS/2: $puertoRatonPS2',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Cantidad de DisplayPorts: $numDisplayPorts',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Cantidad de Puertos tipo A USB 3.2 Gen 2x2 Tipo C: $numPuertosUSB32Gen2x2C',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Cantidad de Puertos tipo A USB 3.0 (Gen 1): $numPuertosUSB30',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Memoria:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Tipo de Memoria Interna: $tipoMemoria',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Memoria Interna: $memoriaInterna',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Velocidad de Memoria del Reloj: $velocidadMemoria',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Canales de Memoria: $canalesMemoria',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$$precio',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
