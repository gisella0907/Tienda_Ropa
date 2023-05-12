import 'dart:convert';

import 'package:flutter/material.dart';
import 'objects/productos_id.dart';
import 'package:tienda_ropa/inicio.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tienda_ropa/funcionalidades/crearqr.dart';
import 'package:tienda_ropa/models/novedades_response.dart';
import 'package:tienda_ropa/objects/peticionesGet.dart';
import 'package:tienda_ropa/models/productos_response.dart';
import 'package:tienda_ropa/objects/peticionesPut.dart';

class AdministrarProductos extends StatefulWidget {
  AdministrarProductos(this.products,{super.key});
  List<ProductosList> products;

  @override
  State<AdministrarProductos> createState() => _AdministrarProductosState();
}

class _AdministrarProductosState extends State<AdministrarProductos> {

  @override
  void initState() {
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    String _searchText = '';
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
                    onPressed: () async {
                        List<Novedades> novedades =
                            await getNovedadesData();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Inicio(novedades)),
                        );
                      },
                    icon: const Icon(Icons.arrow_back),
                    color: Color.fromRGBO(140, 24, 68, 1),
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
                              // const SizedBox(width: 15),
                              Container(
                                width: 175,
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
                            children: widget.products
                                .map((product) => Container(
                                        child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              // color: Colors.cyan,
                                              child: Checkbox(
                                                value: product.estado,
                                                onChanged: (value) {
                                                },
                                                activeColor:
                                                    const Color.fromRGBO(
                                                        140, 24, 68, 1),
                                              ),
                                            ),
                                            Container(
                                              width: 175,
                                              child: Text(
                                                product.nombre,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            // const SizedBox(width: 15),
                                            Container(
                                              width: 70,
                                              child: Text(
                                                product.unidades.toString(),
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
                                                      context, product.id);
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

class EditProduct extends StatefulWidget {
  ProductosList product;
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController estiloController = TextEditingController();
  final TextEditingController garantiaController = TextEditingController();
  final TextEditingController genVestuarioController = TextEditingController();
  final TextEditingController imagenController = TextEditingController();
  final TextEditingController materialController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController paisController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController tallaController = TextEditingController();
  final TextEditingController unidadesnController = TextEditingController();
  EditProduct(this.product) {
    descripcionController.text = product.descripcion;
    estiloController.text = product.estilo;
    garantiaController.text = product.garantia;
    genVestuarioController.text = product.generoVestuario;
    imagenController.text = product.imagen;
    materialController.text = product.material;
    nombreController.text = product.nombre;
    paisController.text = product.paisOrigen;
    precioController.text = product.precio.toString();
    tallaController.text = product.talla;
    unidadesnController.text = product.unidades.toString();
  }

  @override
  State<EditProduct> createState() => _EditProduct();
}

class _EditProduct extends State<EditProduct> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 141, 26, 74),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 25, bottom: 20),
          ),
          const Text("Modificar Producto",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
          Container(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: widget.descripcionController,
                    ),
                    TextFormField(
                      controller: widget.estiloController,
                    ),
                    TextFormField(
                      controller: widget.garantiaController,
                    ),
                    TextFormField(
                      controller: widget.genVestuarioController,
                    ),
                    TextFormField(
                      controller: widget.imagenController,
                    ),
                    TextFormField(
                      controller: widget.materialController,
                    ),
                    TextFormField(
                      controller: widget.nombreController,
                    ),
                    TextFormField(
                      controller: widget.paisController,
                    ),
                    TextFormField(
                      controller: widget.precioController,
                    ),
                    TextFormField(
                      controller: widget.tallaController,
                    ),
                    TextFormField(
                      controller: widget.unidadesnController,
                    ),
                    CheckboxListTile(
                      title: Text('Estado'),
                      value: widget.product.estado,
                      onChanged: (bool? value) {
                        setState(() {
                          widget.product.estado = value!;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          Container(
              height: 50,
              width: screenSize.width - 40,
              margin: const EdgeInsets.only(
                  top: 45, left: 20, right: 20, bottom: 25),
              child: FilledButton(
                  style: FilledButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 141, 26, 74),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    var novedadesPut = await updateProductos(
                        widget.product.id,
                        widget.descripcionController.text,
                        widget.estiloController.text,
                        widget.garantiaController.text,
                        widget.genVestuarioController.text,
                        widget.imagenController.text,
                        widget.materialController.text,
                        widget.nombreController.text,
                        widget.paisController.text,
                        int.parse(widget.precioController.text),
                        widget.tallaController.text,
                        int.parse(widget.unidadesnController.text),
                        widget.product.estado);
                    if (novedadesPut == "Actualizacion Exitosa") {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                  title: Text('Actualizacion Exitosa'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: ()  {
                                        
                                      },
                                      child: const Text('Aceptar'),
                                    ),
                                  ]));
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Inicio()),
                      );*/
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                  title: Text(
                                      'No se pudo realizar la actualizacion'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('Aceptar'),
                                    ),
                                  ]));
                    }
                  },
                  child: const Text("Actualizar"))),
        ]),
      ),
    );
  }
}
