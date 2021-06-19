import 'package:meta/meta.dart';

class Team {
  final String name;
  final String location;
  final String image_url;

  const Team({
    @required this.name,
    @required this.location,
    @required this.image_url,
  });

  static Team fromJson(json) => Team(
        name: json['name'],
        location: json['location'],
        image_url: json['image_url'],
      );
}
