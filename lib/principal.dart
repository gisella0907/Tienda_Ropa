import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tienda_ropa/iniciar_sesion.dart';
import 'package:tienda_ropa/registro.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:tienda_ropa/funcionalidades/leerqr.dart';
import 'package:tienda_ropa/models/productos_response.dart';
import 'package:tienda_ropa/objects/peticionesGet.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  String _scanBarcode = 'Unknown';
  List<ProductosList> productos = [];
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
  void initState() {
    _fetchProductData();
    super.initState();
  }

  Future<void> _fetchProductData() async {
    productos = await getProductsData();
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
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(children: [
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              '     Productos',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.qr_code),
                              color: const Color.fromARGB(255, 141, 26, 74),
                              onPressed: () {},
                            ),
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
                      margin: const EdgeInsets.only(top: 25, bottom: 20),
                      child: Column(
                        children: productos.map((producto) {
                          if (producto.estado == true) {
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.network(producto.imagen),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: IconButton(
                                    icon: const Icon(Icons.help),
                                    color:
                                        const Color.fromARGB(255, 141, 26, 74),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LeerQR(producto.id)),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        }).toList(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 0.5, bottom: 20),
                    ),
                    TextButton(
                      onPressed: (() async {
                        launchUrl(whatsApp);
                      }),
                      style: TextButton.styleFrom(
                        foregroundColor: const Color.fromARGB(
                            255, 18, 196, 71), // foreground
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 18, 196, 71),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        fixedSize: const Size(325, 45),
                      ),
                      child: Container(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 0.5, bottom: 20),
                    ),
                  ]),
                ),
              ),
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
