import 'package:flutter/material.dart';
import 'package:travel_ui/model/Destination.dart';

class ActivitiesAndDescription extends StatelessWidget {
  final Destination destination;
  final double carouselHeight;
  final double cardWidth;

  const ActivitiesAndDescription({
    Key key,
    @required this.carouselHeight,
    @required this.cardWidth,
    this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: carouselHeight * 0.55,
      child: Container(
        height: carouselHeight * 0.43,
        width: cardWidth,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.95),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${destination.activities.length} activities",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  destination.description,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
