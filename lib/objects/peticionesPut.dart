import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tienda_ropa/models/novedades_response.dart';

Future<String> updateNovedades(String id, String descripcion, String imagen, bool estado ) async {
  final response = await http.put(
    Uri.parse("https://tienda-ropa-27af7-default-rtdb.firebaseio.com/novedades/${id}.json"),
    body: jsonEncode(<String, dynamic>{
      "descripcion": descripcion,
      "estado": estado,
      "imagen": imagen
    }),
  );
  if (response.statusCode == 200) {
    return "Actualizacion Exitosa";
  } else {
    throw Exception('No se puede actualizar la novedad');
  }
}