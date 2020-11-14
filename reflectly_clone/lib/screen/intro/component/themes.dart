import 'package:flutter/material.dart';

class Themes extends StatefulWidget {
  final PageController pageController;

  const Themes({
    Key key,
    this.pageController,
  }) : super(key: key);

  @override
  _ThemesState createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  @override
  Widget build(BuildContext context) {
    List<Widget> colors = List();
    for (int i = 0; i < 10; i++) {
      colors.add(Stack(
        children: [
          Positioned(
            top: 100,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 3, color: Colors.white),
                  color: Colors.blue),
            ),
          ),
        ],
      ));
    }
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.up,
            children: [
              Text(
                "Themes, {name}!\nWhich one is most you?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "can be changed later in settings".toUpperCase(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black26,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // todo: color selector
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    pageSnapping: true,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 140,
          child: FlatButton(
            disabledColor: Colors.black12,
            textColor: Color(0xFF7173c7),
            color: Colors.white,
            padding: EdgeInsets.only(
              top: 15,
              bottom: 15,
              left: 100,
              right: 100,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            onPressed: () {
              widget.pageController
                ..animateToPage(
                  3,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
            },
            child: Text("next".toUpperCase()),
          ),
        ),
      ],
    );
  }
}
