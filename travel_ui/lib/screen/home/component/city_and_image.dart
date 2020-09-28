import 'package:flutter/material.dart';
import 'package:travel_ui/model/Destination.dart';

class CityAndImage extends StatelessWidget {
  final Destination destination;

  const CityAndImage({
    Key key,
    this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
        color: Colors.greenAccent,
        image: DecorationImage(
          image: AssetImage(destination.iamge),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.softLight),
        ),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                destination.city,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.near_me,
                    size: 13,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      destination.country,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
