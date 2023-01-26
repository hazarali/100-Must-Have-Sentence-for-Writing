import "package:flutter/material.dart";
import 'package:hundredsentences/Bodies.dart';
import 'package:hundredsentences/BuildYourTemp.dart';
import 'package:hundredsentences/Conclusion.dart';
import 'package:hundredsentences/Introduction.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                    //color: Color(0xFFF06292),
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(70),
                    ),
                  ),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Text(
                      //"100 sentences",
                      //style: Theme.of(context).textTheme.headline4,
                      //),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset("assets/books.png"),
                    ],
                  )),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.66,
                decoration: BoxDecoration(
                  //color: Color(0xFFF06292),
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.66,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: ListView(
                      children: [
                        buildNavigation(
                            text: "INTRODUCTION",
                            icon: Icons.start,
                            widget: Introduction(),
                            context: context),
                        buildNavigation(
                            text: "BODY",
                            icon: Icons.developer_mode,
                            widget: Bodies(),
                            context: context),
                        buildNavigation(
                            text: "CONCLUSION",
                            icon: Icons.last_page,
                            widget: Conclusion(),
                            context: context),
                        buildNavigation(
                            text: "BUILD YOUR TEMPLATE",
                            icon: Icons.last_page,
                            widget: BuildYourTemplate(),
                            context: context),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildNavigation(
    {required String text,
    required IconData icon,
    widget,
    BuildContext? context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context!, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    },
    child: Padding(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF674AEF)),
            //color: Color(0xFFF06292),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ),
  );
}
