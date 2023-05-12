import 'package:flutter/material.dart';
import 'objects/productos_id.dart';
import 'package:tienda_ropa/inicio.dart';
import 'package:tienda_ropa/productos.dart';
import 'package:tienda_ropa/models/productos_response.dart';
import 'package:tienda_ropa/objects/peticionesGet.dart';

class DetalleCompra extends StatefulWidget {
  DetalleCompra(this.carritoCompra, {super.key});
  List<ProductosList> carritoCompra;
  @override
  State<DetalleCompra> createState() => _DetalleCompraState();
}

class _DetalleCompraState extends State<DetalleCompra> {
  bool isChecked = false;
  void _toggleCheckbox() {
    setState(() {
      isChecked = !isChecked;
    });
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
                    onPressed: () async {
                      List<ProductosList> productos = await getProductsData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Productos(productos)),
                      );
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Color.fromRGBO(140, 24, 68, 1),
                  ),
                ),
              ),
              const Text(
                'Detalle Compra',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
              ),
              Expanded(
                child: Container(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    color: Color.fromRGBO(140, 24, 68, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          //scrollDirection: Axis.horizontal,
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
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 15),                               
              child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 220,
                                child: const Text(
                                  "PRODUCTO",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: 80,
                                child: const Text(
                                  "UNIDADES",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: 50,
                                child: const Text(
                                  "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ]
                ),
                Column(                  
                    children: widget.carritoCompra
                        .map((carrito) => Container(
                                child: Column(
                              children: [
                                Row(                                  
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 220,                                    
                                      child: Text(
                                        carrito.descripcion,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      child: Text(
                                        carrito.unidades.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      child: IconButton(
                                        onPressed: () => {},
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Color.fromRGBO(140, 24, 68, 1),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 1),
                                  ],
                                ),
                                const Divider(
                                  thickness: 2,
                                  color: Colors.grey,
                                ),
                              ],
                            )))
                        .toList()),
              ],
            ),
          )),
          Container(
            height: 50,
            width: screenSize.width - 40,
            margin: const EdgeInsets.only(top: 45, left: 20, right: 20),
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Color.fromRGBO(
                    140, 24, 68, 1), // Cambiar el color de fondo aquí
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text("Confirmar compra "),
            ),
          ),
        ],
      )),
    );
  }
}
