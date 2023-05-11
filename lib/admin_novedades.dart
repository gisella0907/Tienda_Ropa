import 'package:flutter/cupertino.dart';
import 'package:tienda_ropa/inicio.dart';
import 'package:flutter/material.dart';
import 'package:tienda_ropa/models/novedades_response.dart';
import 'package:tienda_ropa/objects/peticionesPut.dart';
import 'package:tienda_ropa/objects/peticionesGet.dart';

class AdministrarNovedades extends StatefulWidget {
  AdministrarNovedades(this.novedades, {super.key});
  List<Novedades> novedades;

  @override
  State<AdministrarNovedades> createState() => _AdministrarNovedadesState();
}

class _AdministrarNovedadesState extends State<AdministrarNovedades> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 141, 26, 74),
          title: const Text("Detalle Descuentos"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: widget.novedades.map((novedad) {
              return Container(
                height: 50,
                padding: const EdgeInsets.only(left: 20, right: 20),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.orange),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditNovedades(novedad))),
                        icon: Icon(Icons.edit)),
                    Text(novedad.descripcion)
                  ],
                ),
              );
            }).toList(),
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
                                            AdministrarNovedades(novedades)),
                                  );
                                },
                              child: const Text('Aceptar'),
                            ),
                          ]
                        )
                      );
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Inicio()),
                      );*/
                    }else{
                      showDialog(
                        context: context, 
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('No se pudo realizar la actualizacion'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('Aceptar'),
                            ),
                          ]
                        )
                      );
                    }
                  },
                  child: const Text("Actualizar"))),
        ]),
      ),
    );
  }
}
