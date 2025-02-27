import 'package:flutter/material.dart';
import 'package:aplication_noticias/services/news_api.dart';
import 'package:aplication_noticias/models/noticias_model.dart';
import 'package:aplication_noticias/widgets/noticias_card.dart'; 

class NoticiasScreen extends StatefulWidget {
  const NoticiasScreen({super.key});

  @override
  _NoticiasScreenState createState() => _NoticiasScreenState();
}

class _NoticiasScreenState extends State<NoticiasScreen> {
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
      appBar: AppBar(title: Text('Noticias')),
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
                final noticia = Noticias.fromJson(article);
                return NoticiasCard(noticia: noticia); 
              },
            );
          }
        },
      ),
    );
  }
}