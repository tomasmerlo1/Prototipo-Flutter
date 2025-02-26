import 'package:flutter/material.dart';
import 'package:aplication_noticias/services/news_api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:aplication_noticias/screens/noticia_detalle_api_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NewsApi _newsApi = NewsApi();
  late Future<List<dynamic>> _news;

  @override
  void initState() {
    super.initState();
    _news = _newsApi.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BAHIA NOTICIAS'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _news,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: article['image'] != null
                        ? Image.network(article['image'], width: 100, fit: BoxFit.cover)
                        : null,
                    title: Text(article['title'] ?? 'Sin título'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(article['description'] ?? 'Sin descripción'),
                        Text('Autor: ${article['author'] ?? 'Desconocido'}'),
                        Text('Fecha: ${article['published_at'] ?? 'Sin fecha'}'),
                        Text('Categoría: ${article['category'] is List ? article['category'].join(', ') : article['category'] ?? 'Sin categoría'}'),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoticiaDetalleApiScreen(noticia: article),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}