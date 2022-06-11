import 'activity_model.dart';

class Destination {
  late String imageUrl;
  late String city;
  late String country;
  late String description;
  late List<Activity> activities;

  Destination({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
    required this.activities,
  });
}
