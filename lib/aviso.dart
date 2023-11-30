import 'package:flutter/material.dart';

class AvisoPrivacidadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aviso de Privacidad'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Aviso de Privacidad de ArmaTech: Ensamblaje de Computadoras',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Fecha de última actualización: 29/11/2023',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            Text(
              'Este Aviso de Privacidad describe cómo ArmaTech recopila, utiliza y protege la información personal que obtiene a través de su aplicación de ensamblaje de computadoras. Al utilizar nuestra aplicación, aceptas las prácticas descritas en este aviso.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '1. Información Recopilada',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1.1 Información de Registro',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              'Al registrarte en la aplicación ArmaTech, recopilamos información como tu nombre, dirección de correo electrónico y contraseña.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '1.2 Información de Hardware',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              'La aplicación puede recopilar información sobre los componentes de hardware de tu computadora para proporcionar servicios personalizados y mejorar la experiencia del usuario.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '1.3 Información de Uso',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              'Registramos información sobre cómo utilizas la aplicación, incluidas las configuraciones seleccionadas y las acciones realizadas.',
              style: TextStyle(fontSize: 16),
            ),
            // Agregar el resto de la información de la sección 1 según sea necesario
            SizedBox(height: 20),
            Text(
              '2. Uso de la Información',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '2.1 Personalización de Servicios',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              'Utilizamos la información recopilada para personalizar la experiencia del usuario, ofrecer recomendaciones de componentes y mejorar nuestros servicios.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2.2 Comunicación',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              'Podemos utilizar tu dirección de correo electrónico para enviarte actualizaciones sobre la aplicación, información importante y promociones relacionadas con ArmaTech.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2.3 Mejora Continua',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              'Analizamos la información recopilada para mejorar la calidad de nuestra aplicación y desarrollar nuevas características.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '3. Compartir Información',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'No compartimos tu información personal con terceros sin tu consentimiento, a menos que sea necesario para cumplir con la ley o proteger nuestros derechos.',
              style: TextStyle(fontSize: 16),
            ),
            // Agregar el contenido de la sección 3
            // ...
            SizedBox(height: 20),
            Text(
              '4. Seguridad',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Tomamos medidas para proteger tu información contra accesos no autorizados, alteraciones, divulgaciones o destrucciones no autorizadas.',
              style: TextStyle(fontSize: 16),
            ),
            // Agregar el contenido de la sección 4
            // ...
            SizedBox(height: 20),
            Text(
              '5. Acceso y Control de la Información',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Puedes acceder y actualizar tu información personal en la aplicación. Si deseas eliminar tu cuenta, contáctanos a través de armatech@gmail.com.',
              style: TextStyle(fontSize: 16),
            ),
            // Agregar el contenido de la sección 5
            // ...
            SizedBox(height: 20),
            Text(
              '6. Cambios en la Política de Privacidad',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Nos reservamos el derecho de actualizar este aviso de privacidad. Te notificaremos sobre cambios significativos y te daremos la opción de revisar y aceptar las nuevas prácticas.',
              style: TextStyle(fontSize: 16),
            ),
            // Agregar el contenido de la sección 6
            // ...
            SizedBox(height: 20),
            Text(
              '7. Contacto',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Si tienes preguntas sobre este aviso de privacidad, contáctanos a través de armatech@gmail.com.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Al utilizar la aplicación ArmaTech, aceptas las prácticas descritas en este aviso de privacidad.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Gracias por confiar en ArmaTech.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
