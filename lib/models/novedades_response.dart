class Novedades {
    String id;
    String descripcion;
    bool estado;
    String imagen;

    Novedades({
        required this.id,
        required this.descripcion,
        required this.estado,
        required this.imagen,
    });

    Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "estado": estado,
        "imagen": imagen,
    };
}