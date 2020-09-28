import 'dart:math';

import 'package:flutter/material.dart';
import 'package:travel_ui/model/Hotel.dart';

import 'carousel_title.dart';

class ExclusiveHotels extends StatelessWidget {
  const ExclusiveHotels({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselTitle(
          title: "Exclusive Hotels",
          onPress: () {},
        ),
        Container(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: min(3, exclusiveHotels.length),
            itemBuilder: (context, index) =>
                buildHotelCard(context, index, exclusiveHotels[index]),
          ),
        ),
      ],
    );
  }

  Widget buildHotelCard(BuildContext context, int index, Hotel hotel) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(hotel.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              hotel.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
