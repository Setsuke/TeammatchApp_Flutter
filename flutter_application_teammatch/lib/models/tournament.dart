import 'package:meta/meta.dart';

class Tournament {
  final String name;
  final String image_url;
  final String slug;

  const Tournament({
    @required this.name,
    @required this.image_url,
    @required this.slug,
  });

  static Tournament fromJson(json) => Tournament(
        name: json['name'],
        image_url: json['image_url'],
        slug: json['slug'],
      );
}
