class Movie {
  final bool adult;
  String backdropPath;
  final String originalTitle;
  final String overview;
  final double popularity;
  String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;
  final int id;

  Movie(
      this.title,
      this.adult,
      this.backdropPath,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.voteAverage,
      this.voteCount,
      this.id);

  @override
  String toString() {
    return 'Movie[title=$title, releaseDate=$releaseDate, id=${id.toString()}]';
  }

  Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        adult = json['adult'],
        backdropPath = json['backdrop_path'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'].toDouble(),
        posterPath = json['poster_path'],
        releaseDate = json['release_date'],
        voteAverage = json['vote_average'].toDouble(),
        voteCount = json['vote_count'],
        id = json['id'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'adult': adult,
        'backdrop_path': backdropPath,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'id': id,
      };
}
