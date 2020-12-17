class Movie {
  final bool adult;
  final String backdrop_path;
  final String original_title;
  final String overview;
  final String popularity;
  final String poster_path;
  final String release_date;
  final String title;
  final double vote_average;
  final double vote_count;
  final int id;

  Movie(
      this.title,
      this.adult,
      this.backdrop_path,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_path,
      this.release_date,
      this.vote_average,
      this.vote_count,
      this.id);

  Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        adult = json['adult'],
        backdrop_path = json['backdrop_path'],
        original_title = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        poster_path = json['poster_path'],
        release_date = json['release_date'],
        vote_average = json['vote_average'],
        vote_count = json['vote_count'],
        id = json['id'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'adult': adult,
        'backdrop_path': backdrop_path,
        'original_title': original_title,
        'overview': overview,
        'popularity': popularity,
        'poster_path': poster_path,
        'release_date': release_date,
        'vote_average': vote_average,
        'vote_count': vote_count,
        'id': id,
      };
}
