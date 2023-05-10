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
                                onPressed: () => ({}),
                                icon: Icon(Icons.arrow_circle_right_outlined)),
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
