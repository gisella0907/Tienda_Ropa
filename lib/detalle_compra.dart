import 'package:flutter/material.dart';
import 'objects/productos_id.dart';
import 'package:tienda_ropa/inicio.dart';
import 'package:tienda_ropa/productos.dart';

class DetalleCompra extends StatefulWidget {
  const DetalleCompra({super.key});

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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Productos()),
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
      body: Column(
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  const Text("Producto",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text("Unidades",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Container(),
                ]),
          ),
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('', style: TextStyle(color: Colors.black)),
                Text(productos[0].nombre,
                    style: TextStyle(color: Colors.black)),
                Text(productos[0].unidades.toString(),
                    style: TextStyle(color: Colors.black)),
                IconButton(
                    onPressed: () {},
                    icon:
                        Icon(Icons.edit, color: Color.fromRGBO(140, 24, 68, 1)))
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('', style: TextStyle(color: Colors.black)),
                Text(productos[1].nombre,
                    style: TextStyle(color: Colors.black)),
                Text(productos[1].unidades.toString(),
                    style: TextStyle(color: Colors.black)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit,
                        color: Color.fromRGBO(140, 24, 68, 1))),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('', style: TextStyle(color: Colors.black)),
                Text(productos[1].nombre,
                    style: TextStyle(color: Colors.black)),
                Text(productos[1].unidades.toString(),
                    style: TextStyle(color: Colors.black)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit,
                        color: Color.fromRGBO(140, 24, 68, 1))),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('', style: TextStyle(color: Colors.black)),
                Text(productos[1].nombre,
                    style: TextStyle(color: Colors.black)),
                Text(productos[1].unidades.toString(),
                    style: TextStyle(color: Colors.black)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit,
                        color: Color.fromRGBO(140, 24, 68, 1))),
              ],
            ),
            Divider(),
          ]),
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
      ),
    );
  }
}
