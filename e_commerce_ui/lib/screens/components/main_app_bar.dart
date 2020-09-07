import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce_ui/constants.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  MainAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: (Navigator.canPop(context) ? kTextColor : kTextLightColor),
        ),
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}
