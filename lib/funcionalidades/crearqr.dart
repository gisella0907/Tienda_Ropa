import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tienda_ropa/admin_productos.dart';
import 'package:http/http.dart' as http;

class CrearQR extends StatefulWidget {
  final String id;

  CrearQR(this.id, {super.key});

  @override
  State<CrearQR> createState() => _CrearQRState();
}

class _CrearQRState extends State<CrearQR> {
  // final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
            //color: Colors.amber,
            // padding: EdgeInsets.symmetric(horizontal: 16.0),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AdministrarProductos()),
                        );
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: const Color.fromRGBO(140, 24, 68, 1),
                    ),
                  ),
                ),
                const Text(
                  'Administrador de Productos',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                ),
                Expanded(
                  child: Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      color: const Color.fromRGBO(140, 24, 68, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Scrollbar(
              child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30, top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImage(
                  data: widget.id,
                  size: 200,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(height: 40),
              ],
            ),
          )),
        ));
  }
}
