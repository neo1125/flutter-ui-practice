import 'package:travel_ui/model/Activity.dart';

class Destination {
  final String iamge, city, country, description;
  final List<Activity> activities;

  Destination({
    this.iamge,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}

List<Destination> topDestinations = [
  Destination(
    iamge: "assets/images/venice.jpg",
    country: "Italy",
    city: "Venice",
    description: "Enjoy best trips from top travel agencies at best prices",
    activities: veniceActivities,
  ),
  Destination(
    iamge: "assets/images/paris.jpg",
    country: "France",
    city: "Paris",
    description: "Unique and custom organized by location at best price travel",
    activities: parisActivities,
  ),
  Destination(
    iamge: "assets/images/santorini.jpg",
    country: "Greece",
    city: "Santorini",
    description: "Very beauty",
    activities: santoriniActivities,
  ),
  Destination(
    iamge: "assets/images/saopaulo.jpg",
    country: "Brazle",
    city: "Saopaulo",
    description: "nice~~~",
    activities: saopauloActivities,
  ),
];
