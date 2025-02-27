class Noticias {
  final String titulo;
  final String descripcion;
  final String contenidototal;
  final String imagen;
  final String autor;
  final String fecha;
  final dynamic categoria;

  Noticias({
    required this.titulo,
    required this.descripcion,
    required this.contenidototal,
    required this.imagen,
    required this.autor,
    required this.fecha,
    required this.categoria,
  });

  factory Noticias.fromJson(Map<String, dynamic> json) {
    return Noticias(
      titulo: json['title'] ?? '',
      descripcion: json['description'] ?? '',
      contenidototal: json['content'] ?? '',
      imagen: json['image'] ?? '',
      autor: json['author'] ?? '',
      fecha: json['published_at'] ?? '',
      categoria: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': titulo,
      'description': descripcion,
      'content': contenidototal,
      'image': imagen,
      'author': autor,
      'published_at': fecha,
      'category': categoria,
    };
  }
}