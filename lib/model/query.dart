import 'package:video_streamer/model/movie.dart';

class Query {
  final int page;
  final List<Movie> results;

  Query(this.page, this.results);

  Query.fromJson(Map<String, dynamic> json)
      : page = json['page'],
        results = json['results'];

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': results,
      };
}
