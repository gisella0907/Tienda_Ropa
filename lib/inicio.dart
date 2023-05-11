//mateapp
import 'package:flutter/material.dart';
import 'package:tienda_ropa/models/novedades_response.dart';
import 'package:tienda_ropa/productos.dart';
import 'package:tienda_ropa/Principal.dart';
import 'package:tienda_ropa/admin_productos.dart';
import 'package:tienda_ropa/objects/peticionesGet.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tienda_ropa/admin_novedades.dart';
/*Para acceder a la variable tipoUsuario
SharedPreferences prefs = await SharedPreferences.getInstance();
String tipoAlmacenado = prefs.getString('tipoUsuario');*/

class Inicio extends StatefulWidget {
  Inicio(this.novedades,{super.key});
  List<Novedades> novedades;

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  var _isSelected = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Productos()),
                      );
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
                    onTap: () async {
                      /*List<String, dynamic> products = await getProductsData();
                      setState(() => _isSelected[3] = !_isSelected[3]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AdministrarProductos(products)),
                      );*/
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
          child: Column(children: [
            Container(
                margin: const EdgeInsets.only(top: 25, bottom: 20),
                child: Image.asset("images/LogoLG.png", height: 130),
                alignment: Alignment.center),
            Container(
              //margin: const EdgeInsets.only(top: 1,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("  Inicio",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  IconButton(
                      icon: Icon(Icons.edit,
                          color: Color.fromARGB(255, 141, 26, 74), size: 30),
                      onPressed: () async {
                        List<Novedades> novedades =
                            await getNovedadesData();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AdministrarNovedades(novedades)),
                        );
                      })
                ],
              ),
            ),
            Container(
                child: Row(children: [
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
            Column(
              children: widget.novedades.map((novedad){
                if (novedad.estado == true) {
                  return Container(
                    margin: const EdgeInsets.only(top: 25, bottom: 20),
                    child: Image.network(novedad.imagen),
                    alignment: Alignment.center
                  );
                }else{
                  return Container();
                }
              }).toList(),
            ),
          ]),
        )));
  }
}
