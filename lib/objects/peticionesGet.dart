import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

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
