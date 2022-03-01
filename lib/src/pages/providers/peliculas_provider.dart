import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/pages/models/pelicula_model.dart';

class PeliculasProvider {
  final String _apikey = '24baaa07c806e8e72b2b1f1a7194c21f';
  final String _url = 'api.themoviedb.org';
  final String _language = 'es-ES';

  Future<List<ResultPelicula>> getPeliculas(Uri url) async {
    final response = await http.get(url);
    final dataDecoded = json.decode(response.body);

    final peliculas = Peliculas.fromJsonList(dataDecoded['results']);
    return peliculas.items;
  }

  Future<List<ResultPelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _language,
    });
    
    return await getPeliculas(url);
  }

  Future<List<ResultPelicula>> getPopulares() async {
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
    });
    return await getPeliculas(url);
  }
}
