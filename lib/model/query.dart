import 'package:video_streamer/model/movie.dart';

class Query {
  final int page;
  final List<dynamic> results;

  List<dynamic> dynamicList;

  Query({this.page, this.results});

  factory Query.fromJson(Map<String, dynamic> json) {
    return Query(
      page: json['page'] as int,
      results: json['results'] as List<dynamic>,
    );
  }

  List<Movie> getList() =>
      results.map<Movie>((e) => Movie.fromJson(e)).toList();

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': results,
      };
}
