import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tienda_ropa/iniciar_sesion.dart';
import 'package:tienda_ropa/registro.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:tienda_ropa/funcionalidades/leerqr.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  String _scanBarcode = 'Unknown';

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LeerQR(_scanBarcode)),
      );
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    const phone = '+573142506683'; // Número de teléfono
    const message = 'Conocer mas info acerca de un producto'; // Mensaje
    final Uri whatsApp =
        Uri.parse('whatsapp://send?phone=$phone&text=$message');

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white, toolbarHeight: 0, elevation: 0),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(children: [
              Image.asset("images/LogoLG.png", height: 130),
              Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 20),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SingUp()),
                        );
                      },
                      child: const Text('Iniciar Sesión'),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 141, 26, 74)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Registro()),
                        );
                      },
                      child: const Text('Registrarse'),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 1, 2, 82)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ])),
              Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const Text(
                    '     Productos',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const Spacer(),
                  IconButton(
                      icon: const Icon(Icons.qr_code),
                      color: const Color.fromARGB(255, 141, 26, 74),
                      onPressed: () => {
                            scanQR(),
                          }),
                ]),
              ),
              Container(
                  child: Row(children: const [
                SizedBox(width: 10),
                Expanded(
                    child: Divider(
                  thickness: 2,
                  color: Colors.black,
                )),
                Expanded(
                    child: Divider(
                  thickness: 2,
                )),
              ])),
              Container(
                  child: Table(
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Column(
                          children: [
                            const Text('Short Jean',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 87, 83, 85))),
                            Stack(children: [
                              Image.asset('images/prenda1.png'),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.help,
                                    color: Color.fromARGB(255, 141, 26, 74),
                                  ),
                                  onPressed: () {
                                    // Acción cuando se presiona el icono
                                  },
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                      TableCell(
                        child: Column(
                          children: [
                            const Text('Chaqueta efecto cuero',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 87, 83, 85))),
                            Stack(children: [
                              Image.asset('images/prenda3.png'),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.help,
                                    color: Color.fromARGB(255, 141, 26, 74),
                                  ),
                                  onPressed: () {
                                    // Acción cuando se presiona el icono
                                  },
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Column(
                          children: [
                            const Text('Camisa polo',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 87, 83, 85))),
                            Stack(children: [
                              Image.asset('images/prenda2.png'),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.help,
                                    color: Color.fromARGB(255, 141, 26, 74),
                                  ),
                                  onPressed: () {
                                    // Acción cuando se presiona el icono
                                  },
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                      TableCell(
                        child: Column(
                          children: [
                            const Text('Chaqueta beisbolera azul',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 87, 83, 85))),
                            Stack(children: [
                              Image.asset('images/prenda4.png'),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.help,
                                    color: Color.fromARGB(255, 141, 26, 74),
                                  ),
                                  onPressed: () {
                                    // Acción cuando se presiona el icono
                                  },
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Column(
                          children: [
                            const Text('Crop top',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 87, 83, 85))),
                            Stack(children: [
                              Image.asset('images/prenda5.png'),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.help,
                                    color: Color.fromARGB(255, 141, 26, 74),
                                  ),
                                  onPressed: () {
                                    // Acción cuando se presiona el icono
                                  },
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                      TableCell(
                        child: Column(
                          children: [
                            const Text('Chaqueta beisbolera beige',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 87, 83, 85))),
                            Stack(children: [
                              Image.asset('images/prenda6.png'),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.help,
                                    color: Color.fromARGB(255, 141, 26, 74),
                                  ),
                                  onPressed: () {
                                    // Acción cuando se presiona el icono
                                  },
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
              Container(
                margin: const EdgeInsets.only(top: 0.5, bottom: 20),
              ),
              TextButton(
                onPressed: (() async {
                  launchUrl(whatsApp);
                }),
                style: TextButton.styleFrom(
                  foregroundColor:
                      const Color.fromARGB(255, 18, 196, 71), // foreground
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 18, 196, 71),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  fixedSize: const Size(325, 45),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/Whatsapp.png',
                      width: 24.0,
                      height: 24.0,
                    ),
                    const SizedBox(
                        width: 8.0), // Separación entre la imagen y el texto
                    const Text(
                      'Contacto',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 0.5, bottom: 20),
              ),
            ]),
          ),
        ));
  }
}
