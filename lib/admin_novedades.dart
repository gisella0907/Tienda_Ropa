import 'package:tienda_ropa/inicio.dart';
import 'package:flutter/material.dart';
import 'package:tienda_ropa/models/novedades_response.dart';

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
            children: widget.novedades
                .map((novedad) {
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
                                        builder: (context) =>
                                            EditNovedad(novedad))),
                                icon: Icon(Icons.edit)),
                            Text(novedad.descripcion)
                          ],
                        ),
                  );
                    })
                .toList(),
          ),
        ));
  }
}

class EditNovedad extends StatelessWidget {
  Novedades _novedades;
  EditNovedad(this._novedades);

  final _formKey = GlobalKey<FormState>();
          
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
      

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 25, bottom: 20),
          ),
          const Text("Detalle Tareas",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
          Container(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: descripcionController,
                    ),
                    TextFormField(                      
                      controller: estadoController,
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

