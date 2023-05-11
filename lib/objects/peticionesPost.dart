import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tienda_ropa/models/novedades_response.dart';


Future<String> addNovedades(String descripcion,bool estado,String imagen)async {
final response = await http.post(
  Uri.parse("https://tienda-ropa-27af7-default-rtdb.firebaseio.com/novedades.json"),
    body: json.encode(<String, dynamic>{
            "descripcion": descripcion,
            "estado": estado,
            "imagen": imagen
          }),
          headers: {'Content-Type': 'application/json'});
      print(response.statusCode);
      if (response.statusCode == 200) {
        return "Registro Exitoso";
      } else {
        throw Exception('Ha ocurrido un error, por favor intente de nuevo');
      }
}