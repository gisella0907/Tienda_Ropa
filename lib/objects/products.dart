import 'dart:math';

class Producto {
  String nombre;
  String id = '';
  int unidades;

  Producto({required this.nombre, required this.unidades}) {
    id = generarID();
  }

  String generarID() {
    var rng = new Random();
    const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
    return String.fromCharCodes(Iterable.generate(
        6, (_) => chars.codeUnitAt(rng.nextInt(chars.length)))).toUpperCase();
  }
}
