//mateapp
import 'package:flutter/material.dart';
import 'package:tienda_ropa/inicio.dart';
import 'package:tienda_ropa/Principal.dart';
import 'package:tienda_ropa/admin_productos.dart';
import 'package:tienda_ropa/detalle_compra.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';
//import 'package:tienda_ropa/funcionalidades/leerqr.dart';

class Productos extends StatefulWidget {
  const Productos({super.key});

  @override
  State<Productos> createState() => _ProductosState();
}

class _ProductosState extends State<Productos> {
  var _isSelected = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    //Funcionalidad Whatsapp
    const phone = '+573142506683'; // Número de teléfono
    const message = 'Hola! Deseo obtener más información sobre un producto'; // Mensaje
    final Uri whatsApp =
        Uri.parse('whatsapp://send?phone=$phone&text=$message');

    return Scaffold(
        drawer: Drawer(          
          backgroundColor: Colors.white,
          child: Column(
            children: [
              Container(
                height: screenSize.height / 3, //TAMAÑO DRAWERHEADER
                child: DrawerHeader(
                  decoration: const BoxDecoration(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: IconButton(
                            onPressed: () => {Navigator.of(context).pop()},
                            icon: const Icon(
                              Icons.cancel_outlined,
                              color: Color.fromARGB(255, 141, 26, 74),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const Image(
                            image: AssetImage('images/profile.png'),
                            height: 120,
                            width: 120,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "johanna@company.com",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ]),
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      color: _isSelected[0]
                          ? Color.fromARGB(255, 141, 26, 74)
                          : Colors.grey,
                    ),
                    title: const Text('Inicio'),
                    // tileColor: Colors.amber,
                    tileColor:
                        _isSelected[0] ? Color.fromARGB(26, 244, 4, 4) : null,
                    onTap: () {
                      setState(() => _isSelected[0] = !_isSelected[0]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Inicio()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.library_books_rounded,
                      color: _isSelected[1]
                          ? Color.fromARGB(255, 141, 26, 74)
                          : Colors.grey,
                    ),
                    title: const Text('Productos'),
                    tileColor:
                        _isSelected[1] ? Color.fromARGB(26, 244, 4, 4) : null,
                    onTap: () {
                      setState(() => _isSelected[1] = !_isSelected[1]);
                    },
                  ),
                  ListTile(
                    title: const Text('Cerrar Sesión'),
                    leading: Icon(
                      Icons.exit_to_app,
                      color: _isSelected[2]
                          ? Color.fromARGB(255, 141, 26, 74)
                          : Colors.grey,
                    ),
                    onTap: () {
                      setState(() => _isSelected[2] = !_isSelected[2]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Principal()),
                      );
                    },
                    tileColor:
                        _isSelected[2] ? Color.fromARGB(26, 244, 4, 4) : null,
                  ),
                  Spacer(),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: _isSelected[3]
                          ? Color.fromARGB(255, 141, 26, 74)
                          : Colors.grey,
                    ),
                    title: const Text('Administrar'),
                    onTap: () {
                      setState(() => _isSelected[3] = !_isSelected[3]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdministrarProductos()),
                      );
                    },
                    tileColor:
                        _isSelected[3] ? Color.fromARGB(26, 244, 4, 4) : null,
                  ),
                ],
              )),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 141, 26, 74),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 20, bottom: 20), 
            child: Column(children: [
              Image.asset("images/LogoLG.png", height: 130),
              Container(
                child:
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    '     Productos',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.qr_code),
                    color: Color.fromARGB(255, 141, 26, 74),
                    onPressed: () {
                      
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    color: Color.fromARGB(255, 141, 26, 74),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetalleCompra()),
                      );
                    },
                  ),
                ]),
              ),
              Container(
                  child: Row(children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      )
                   ),
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
                            Text('Short Jean', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color.fromARGB(255, 87, 83, 85))),
                            Stack(children: [
                              Image.asset('images/prenda1.png'),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.help,
                                    color: Color.fromARGB(255, 141, 26, 74),
                                  ),                                  
                                  onPressed: () {
                                    // Acción cuando se presiona el icono
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 23,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add_circle,
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
                            Text('Chaqueta efecto cuero', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color.fromARGB(255, 87, 83, 85))),
                            Stack(children: [
                              Image.asset('images/prenda3.png'),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.help,
                                    color: Color.fromARGB(255, 141, 26, 74),
                                  ),
                                  onPressed: () {
                                    // Acción cuando se presiona el icono
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 23,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add_circle,
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
                            Text('Camisa polo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color.fromARGB(255, 87, 83, 85))),
                            Stack(children: [
                              Image.asset('images/prenda2.png'),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.help,
                                    color: Color.fromARGB(255, 141, 26, 74),
                                  ),
                                  onPressed: () {
                                    // Acción cuando se presiona el icono
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 23,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add_circle,
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
                            Text('Chaqueta beisbolera azul', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color.fromARGB(255, 87, 83, 85))),
                            Stack(children: [
                              Image.asset('images/prenda4.png'),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.help,
                                    color: Color.fromARGB(255, 141, 26, 74),
                                  ),
                                  onPressed: () {
                                    // Acción cuando se presiona el icono
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 23,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add_circle,
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
                            Text('Crop top', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color.fromARGB(255, 87, 83, 85))),
                            Stack(children: [
                              Image.asset('images/prenda5.png'),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.help,
                                    color: Color.fromARGB(255, 141, 26, 74),
                                  ),
                                  onPressed: () {
                                    // Acción cuando se presiona el icono
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 23,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add_circle,
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
                            Text('Chaqueta beisbolera beige', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color.fromARGB(255, 87, 83, 85))),
                            Stack(children: [
                              Image.asset('images/prenda6.png'),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.help,
                                    color: Color.fromARGB(255, 141, 26, 74),
                                  ),
                                  onPressed: () {
                                    // Acción cuando se presiona el icono
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 23,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add_circle,
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
                      Color.fromARGB(255, 18, 196, 71), // foreground
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 18, 196, 71),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  fixedSize: Size(325, 45),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/Whatsapp.png',
                      width: 24.0,
                      height: 24.0,
                    ),
                    SizedBox(
                        width: 8.0), // Separación entre la imagen y el texto
                    Text(
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
        )
      );
  }
}