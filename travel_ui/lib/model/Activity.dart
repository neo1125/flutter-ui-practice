class Activity {
  final String image, title, agency;
  final int price, raiting;
  final List<String> startingTimes;

  Activity({
    this.image,
    this.title,
    this.agency,
    this.price,
    this.raiting,
    this.startingTimes,
  });
}

List<Activity> veniceActivities = [
  Activity(
    image: "assets/images/stmarksbasilica.jpg",
    title: "St.Marks Basilica",
    agency: "sightseeing Tour",
    price: 30,
    raiting: 5,
    startingTimes: ["9:00 AM", "11:00 AM"],
  ),
  Activity(
    image: "assets/images/gondola.jpg",
    title: "Walking Tour gondola ride",
    agency: "sightseeing Tour",
    price: 210,
    raiting: 5,
    startingTimes: ["7:00 AM", "8:00 AM"],
  ),
  Activity(
    image: "assets/images/murano.jpg",
    title: "Murano and Burano Tour",
    agency: "venice Tour",
    price: 170,
    raiting: 3,
    startingTimes: ["1:00 PM", "3:00 PM"],
  ),
];
List<Activity> parisActivities = [];
List<Activity> santoriniActivities = [];
List<Activity> saopauloActivities = [];
