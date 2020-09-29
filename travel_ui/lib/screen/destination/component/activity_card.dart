import 'package:flutter/material.dart';
import 'package:travel_ui/model/Activity.dart';

import 'price.dart';
import 'raiting.dart';
import 'starting_times.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  const ActivityCard({
    Key key,
    this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      margin: EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            activity.title,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              activity.agency,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ),
                          Rating(rate: activity.raiting),
                          StartingTimes(times: activity.startingTimes)
                        ],
                      ),
                    ),
                  ),
                  Price(
                    price: activity.price,
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 100,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage("assets/images/hotel0.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
