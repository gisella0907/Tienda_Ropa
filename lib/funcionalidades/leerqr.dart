import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tienda_ropa/inicio.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tienda_ropa/funcionalidades/crearqr.dart';
import 'package:tienda_ropa/productos.dart';

class LeerQR extends StatefulWidget {
  final String scanBarcode;
  LeerQR(this.scanBarcode);

  @override
  _LeerQRState createState() => _LeerQRState();
}

class _LeerQRState extends State<LeerQR> {
  @override
  void initState() {
    super.initState();
    _fetchProductData();
  }

  Map<String, dynamic> _productData = {};
  Map<String, dynamic> objeto = {};

  Future<void> _fetchProductData() async {
    final response = await http.get(Uri.parse(
        'https://tienda-ropa-27af7-default-rtdb.firebaseio.com/productos.json'));

    if (response.statusCode == 200) {
      setState(() {
        _productData = json.decode(response.body);
        objeto = _productData[widget.scanBarcode];
      });
    } else {
      throw Exception('Failed to fetch product data');
    }
  }

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
                            builder: (context) => const Productos()),
                      );
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: const Color.fromRGBO(140, 24, 68, 1),
                  ),
                ),
              ),
              const Text(
                'PRODUCTO',
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
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        child: const Text(
                          "ID PRODUCTO:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(widget.scanBarcode),
                      )
                    ],
                  ),
                ),

                // 2do
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        child: const Text(
                          "NOMBRE:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(objeto['nombre'].toString()),
                      )
                    ],
                  ),
                ),

                // 3do
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        child: const Text(
                          "DESCRIPCIÓN:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 190,
                        child: Text(objeto['descripcion'].toString()),
                      )
                    ],
                  ),
                ),

                // 4do
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        child: const Text(
                          "ESTILO:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(objeto['estilo'].toString()),
                      )
                    ],
                  ),
                ),

                // 5do
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        child: const Text(
                          "GARANTIA:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(objeto['garantia'].toString()),
                      ),
                    ],
                  ),
                ),

                // 6do
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        child: const Text(
                          "SEXO:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(objeto['generoVestuario'].toString()),
                      )
                    ],
                  ),
                ),

                // 7do
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        child: const Text(
                          "MATERIAL:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(objeto['material'].toString()),
                      )
                    ],
                  ),
                ),

/*
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Image.network(objeto["imagen"].toString()),
                )
                */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
