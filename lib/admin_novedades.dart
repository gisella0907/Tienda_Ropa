import 'package:flutter/cupertino.dart';
import 'package:tienda_ropa/inicio.dart';
import 'package:flutter/material.dart';
import 'package:tienda_ropa/models/novedades_response.dart';
import 'package:tienda_ropa/objects/peticionesPut.dart';
import 'package:tienda_ropa/objects/peticionesGet.dart';
import 'package:tienda_ropa/objects/peticionesPost.dart';

class AdministrarNovedades extends StatefulWidget {
  AdministrarNovedades(this.novedades, {super.key});
  List<Novedades> novedades;

  @override
  State<AdministrarNovedades> createState() => _AdministrarNovedadesState();
}

class _AdministrarNovedadesState extends State<AdministrarNovedades> {
  @override
  Widget build(BuildContext context) {
    String _searchText = '';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
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
                      color: const Color.fromRGBO(140, 24, 68, 1),
                    ),
                  ),
                ),
                const Text(
                  'Administrar Novedades',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                ),
                Expanded(
                  child: Container(
                    child: IconButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddNovedades())),
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
                            children: [
                              Container(
                                width: 70,
                                child: const Text(
                                  "ESTADO",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: 250,
                                child: const Text(
                                  "DESCRIPCION",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: 70,
                                child: const Text(
                                  "EDITAR",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),

                          //FINALIZA PRIMERA FILA DE NOMBRES DE LAS COLUMNAS
                          const SizedBox(height: 20),
                          Column(
                            children: widget.novedades
                                .map((novedad) => Container(
                                        child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 70,
                                              child: Checkbox(
                                                value: novedad.estado,
                                                onChanged: (value) {},
                                              ),
                                            ),
                                            Container(
                                              width: 250,
                                              child: Text(
                                                novedad.descripcion,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            // const SizedBox(width: 15),
                                            Container(
                                              width: 70,
                                              child: IconButton(
                                                onPressed: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EditNovedades(
                                                                novedad))),
                                                icon: const Icon(
                                                  Icons.edit,
                                                  color: Color.fromRGBO(
                                                      140, 24, 68, 1),
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
                                .toList(),
                          ),
                        ],
                      ))),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}

class EditNovedades extends StatefulWidget {
  Novedades novedades;
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController imagenController = TextEditingController();
  EditNovedades(this.novedades) {
    descripcionController.text = novedades.descripcion;
    imagenController.text = novedades.imagen;
  }

  @override
  State<EditNovedades> createState() => _EditNovedad();
}

class _EditNovedad extends State<EditNovedades> {
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
          const Text("Modificar Novedad",
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
                      controller: widget.imagenController,
                    ),
                    CheckboxListTile(
                      title: Text('Estado'),
                      value: widget.novedades.estado,
                      onChanged: (bool? value) {
                        setState(() {
                          widget.novedades.estado = value!;
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
                    var novedadesPut = await updateNovedades(
                        widget.novedades.id,
                        widget.descripcionController.text,
                        widget.imagenController.text,
                        widget.novedades.estado);
                    if (novedadesPut == "Actualizacion Exitosa") {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                  title: Text('Actualizacion Exitosa'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () async {
                                        List<Novedades> novedades =
                                            await getNovedadesData();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdministrarNovedades(
                                                      novedades)),
                                        );
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

class AddNovedades extends StatefulWidget {
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController imagenController = TextEditingController();
  EditNovedades() {}

  @override
  State<AddNovedades> createState() => _AddNovedades();
}

class _AddNovedades extends State<AddNovedades> {
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
          const Text("Añadir Novedad",
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
                      controller: widget.imagenController,
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
                    var novedadesPut = await addNovedades(
                        widget.descripcionController.text,
                        false,
                        widget.imagenController.text);
                    if (novedadesPut == "Registro Exitoso") {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                  title: Text('Registro Exitoso'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () async {
                                        List<Novedades> novedades =
                                            await getNovedadesData();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdministrarNovedades(
                                                      novedades)),
                                        );
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
                                      'No se pudo registrar la novedad'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('Aceptar'),
                                    ),
                                  ]));
                    }
                  },
                  child: const Text("Añadir"))),
        ]),
      ),
    );
  }
}
