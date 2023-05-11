import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tienda_ropa/models/novedades_response.dart';
import 'package:tienda_ropa/models/productos_response.dart';

Future<List<ProductosList>> getProductsData() async {
  var url =
      "https://tienda-ropa-27af7-default-rtdb.firebaseio.com/productos.json";
  final response = await http.get(Uri.parse(url));
  print(response.statusCode);
  if (response.statusCode == 200) {
    var datosPr = json.decode(response.body);
    var idsPr = datosPr.keys.toList();
    if (datosPr is Map) {
      datosPr = datosPr.values.toList();
    }
    List<ProductosList> listProductos = [];
    for (var i = 0; i < datosPr.length; i++) {
      ProductosList registrosPr = ProductosList(
          id: idsPr[i],
          descripcion: datosPr[i]['descripcion'],
          estado: datosPr[i]['estado'],
          estilo: datosPr[i]['estilo'],
          garantia: datosPr[i]['garantia'],
          generoVestuario: datosPr[i]['generoVestuario'],
          imagen: datosPr[i]['imagen'],
          material: datosPr[i]['material'],
          nombre: datosPr[i]['nombre'],
          paisOrigen: datosPr[i]['paisOrigen'],
          precio: datosPr[i]['precio'],
          talla: datosPr[i]['talla'],
          unidades: datosPr[i]['unidades']);
      listProductos.add(registrosPr);
    }
    return listProductos;
  } else {
    throw Exception('Peticion no valida');
  }
}

Future<List<Novedades>> getNovedadesData() async {
  var url =
      "https://tienda-ropa-27af7-default-rtdb.firebaseio.com/novedades.json";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var datos = json.decode(response.body);
    var ids = datos.keys.toList();
    if (datos is Map) {
      datos = datos.values.toList();
    }
    List<Novedades> listNovedades = [];
    for (var i = 0; i < datos.length; i++) {
      Novedades registros = Novedades(
          id: ids[i],
          descripcion: datos[i]['descripcion'],
          estado: datos[i]['estado'],
          imagen: datos[i]['imagen']);
      listNovedades.add(registros);
    }
    return listNovedades;
  } else {
    throw Exception('Peticion no valida');
  }
}
