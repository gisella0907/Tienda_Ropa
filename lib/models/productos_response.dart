class ProductosList {
  String id;
  String descripcion;
  bool estado;
  String estilo;
  String garantia;
  String generoVestuario;
  String imagen;
  String material;
  String nombre;
  String paisOrigen;
  int precio;
  String talla;
  int unidades;

  ProductosList({
    required this.id,
    required this.descripcion,
    required this.estado,
    required this.estilo,
    required this.garantia,
    required this.generoVestuario,
    required this.imagen,
    required this.material,
    required this.nombre,
    required this.paisOrigen,
    required this.precio,
    required this.talla,
    required this.unidades,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "estado": estado,
        "estilo": estilo,
        "garantia": garantia,
        "generoVestuario": generoVestuario,
        "imagen": imagen,
        "material": material,
        "nombre": nombre,
        "paisOrigen": paisOrigen,
        "precio": precio,
        "talla": talla,
        "unidades": unidades
      };
}
