import 'package:meta/meta.dart';

class Team {
  final int id;
  final String name;
  final String location;
  final String image_url;

  Team({
    @required this.id,
    @required this.name,
    @required this.location,
    @required this.image_url,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'image_url': image_url,
    };
  }

  static Team fromJson(json) => Team(
        id: json['id'],
        name: json['name'],
        location: json['location'],
        image_url: json['image_url'],
      );
}
