import 'dart:convert';

import 'package:flutter/material.dart';
import 'objects/productos_id.dart';
import 'package:tienda_ropa/inicio.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tienda_ropa/funcionalidades/crearqr.dart';

class AdministrarProductos extends StatefulWidget {
  const AdministrarProductos({super.key});

  @override
  State<AdministrarProductos> createState() => _AdministrarProductosState();
}

class _AdministrarProductosState extends State<AdministrarProductos> {
  bool isChecked = false;

  void _toggleCheckbox() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  Map<String, dynamic> _productData = {};
  // Map<String, dynamic> objeto = {};

  @override
  void initState() {
    super.initState();
    _fetchProductData();
  }

  Future<void> _fetchProductData() async {
    final response = await http.get(Uri.parse(
        'https://tienda-ropa-27af7-default-rtdb.firebaseio.com/productos.json'));

    if (response.statusCode == 200) {
      setState(() {
        _productData = json.decode(response.body);
        //objeto = _productData['-NV2CtUgzXHye5Q7IfjB'];
      });
    } else {
      throw Exception('Failed to fetch product data');
    }
  }

  @override
  Widget build(BuildContext context) {
    String _searchText = '';
    Producto miProducto = Producto(nombre: "Cahqueta", unidades: 1);
    Producto miProducto2 = Producto(nombre: "Short Jeans", unidades: 1);
    List<Producto> productos = [miProducto, miProducto2];
    final Size screenSize = MediaQuery.of(context).size;

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
                              builder: (context) => const Inicio()),
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
        body: SingleChildScrollView(
          // scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchText = value;
                    });
                  },
                  decoration: InputDecoration(
                    // hintText: 'Buscar...',
                    prefixIcon: const Icon(Icons.search,
                        color: Color.fromRGBO(140, 24, 68, 1)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 16.0),
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  // child:
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                // color: Colors.cyan,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.check_box,
                                        color: Color.fromRGBO(140, 24, 68, 1))),
                              ),
                              Container(
                                width: 160,
                                //  color: Colors.grey,
                                child: const Text(
                                  "ID",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // const SizedBox(width: 15),
                              Container(
                                width: 70,
                                //  color: Colors.cyan,
                                child: const Text(
                                  "NOMBRE",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              //    const SizedBox(width: 15),
                              Container(
                                width: 70,
                                child: const Text(
                                  "UNIDADES",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // const SizedBox(width: 15),
                              Container(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit,
                                        color: Color.fromRGBO(140, 24, 68, 1))),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.qr_code,
                                        color: Color.fromRGBO(140, 24, 68, 1))),
                              ),
                              // SizedBox(width: 1),
                            ],
                          ),

                          //FINALIZA PRIMERA FILA DE NOMBRES DE LAS COLUMNAS
                          const SizedBox(height: 20),
                          Column(
                            children: _productData.entries
                                .map((entry) => Container(
                                        child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              // color: Colors.cyan,
                                              child: Checkbox(
                                                value: isChecked,
                                                onChanged: (value) {
                                                  _toggleCheckbox();
                                                },
                                                activeColor:
                                                    const Color.fromRGBO(
                                                        140, 24, 68, 1),
                                              ),
                                            ),
                                            Container(
                                              width: 160,
                                              child: Text(
                                                entry.key,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            // const SizedBox(width: 15),
                                            Container(
                                              width: 70,
                                              child: Text(
                                                _productData[entry.key]
                                                    ['nombre'],
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            // const SizedBox(width: 15),
                                            Container(
                                              width: 70,
                                              child: Text(
                                                _productData[entry.key]
                                                        ['unidades']
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            // const SizedBox(width: 15),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.edit,
                                                  color: Color.fromRGBO(
                                                      140, 24, 68, 1),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {
                                                  navigateToCreateQR(
                                                      context, entry.key);
                                                },
                                                icon: const Icon(
                                                  Icons.qr_code,
                                                  color: Color.fromRGBO(
                                                      140, 24, 68, 1),
                                                ),
                                              ),
                                            ),
                                            //   const SizedBox(width: 1),
                                          ],
                                        ),
                                        const Divider(
                                          thickness: 2,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    )))
                                .toList(),
                          ),
                        ],
                      ))),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: screenSize.width - 40,
                margin: const EdgeInsets.only(top: 45, left: 20, right: 20),
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(
                        140, 24, 68, 1), // Cambiar el color de fondo aquí
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Actualizar Productos "),
                ),
              ),
            ],
          ),
        ));
  }
}

void navigateToCreateQR(BuildContext context, String key) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CrearQR(key)),
  );
}
