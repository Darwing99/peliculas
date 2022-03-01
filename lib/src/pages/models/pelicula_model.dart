class Peliculas {
  List<ResultPelicula> items = <ResultPelicula>[];
  Peliculas();
  Peliculas.fromJsonList(List<dynamic> jsonlist) {
    for (var item in jsonlist) {
      final pelicula = ResultPelicula.fromJson(item);
      items.add(pelicula);
    }
  }
}

class ResultPelicula {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  ResultPelicula(param0,
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  ResultPelicula.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'].toDouble();
    posterPath = json['poster_path'];
    releaseDate = DateTime.parse(json["release_date"]);
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'].toDouble();
    voteCount = json['vote_count'];
  }

  getPosterImg() {
    // ignore: unnecessary_null_comparison
    if (posterPath == null) {
      return 'https://lh3.googleusercontent.com/proxy/3otPTR_qwbV_KK37cPCSxyTVeUNnDb_KAmlXAlue79KchLcegyqGfHwCNDz6s4cbkXpH00YWmF3xk7R6GKyhScafGIQdhqmDomAD8GxhFFykWLV7pwc';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }
}
