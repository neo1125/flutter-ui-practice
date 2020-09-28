import 'package:flutter/material.dart';
import 'package:travel_ui/model/Destination.dart';

import 'activities_and_description.dart';
import 'carousel_title.dart';
import 'city_and_image.dart';

class TopDestinations extends StatelessWidget {
  const TopDestinations({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double carouselHeight = 300;
    double cardWidth = 240;
    return Column(
      children: [
        CarouselTitle(
          title: "Top Destinations",
          onPress: () {},
        ),
        Container(
          height: carouselHeight,
          margin: EdgeInsets.symmetric(vertical: 15),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: topDestinations.length,
            itemBuilder: (context, index) =>
                buildDestinationCard(cardWidth, carouselHeight, index),
          ),
        ),
      ],
    );
  }

  Widget buildDestinationCard(
      double cardWidth, double carouselHeight, int index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: cardWidth,
        margin: EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            ActivitiesAndDescription(
              carouselHeight: carouselHeight,
              cardWidth: cardWidth,
              destination: topDestinations[index],
            ),
            CityAndImage(
              destination: topDestinations[index],
            ),
          ],
        ),
      ),
    );
  }
}
