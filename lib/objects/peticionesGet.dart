import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tienda_ropa/models/novedades_response.dart';

Future<Map<String, dynamic>> getProductsData() async {
  var url =
      "https://tienda-ropa-27af7-default-rtdb.firebaseio.com/productos.json";
  final response = await http.get(Uri.parse(url));
  print(response.statusCode);
  if (response.statusCode == 200) {
    /*var respJs = json.decode(response.body);
    var idResp = respJs.keys.first;
    var nameResp = respJs.values.first['nombre'];
    var unitResp = respJs.values.first['unidades'];*/
    return json.decode(response.body);
  } else {
    throw Exception('Peticion no valida');
  }
}

Future<List<Novedades>> getNovedadesData() async {
  List<Novedades> data = [];
  var url =
      "https://tienda-ropa-27af7-default-rtdb.firebaseio.com/novedades.json";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var datos = json.decode(response.body);
    var ids = datos.keys.toList();
    if (datos is Map) {
      datos = datos.values.toList();
    }
    List<Novedades> registros = [];
    for (var i = 0; i < datos.length; i++) {
      Novedades prueba = Novedades(
          id: ids[i],
          descripcion: datos[i]['descripcion'],
          estado: datos[i]['estado'],
          imagen: datos[i]['imagen']);
      registros.add(prueba);
    }
    return registros;
  } else {
    throw Exception('Peticion no valida');
  }
}
