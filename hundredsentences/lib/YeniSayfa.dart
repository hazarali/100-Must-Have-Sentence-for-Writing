import 'package:flutter/material.dart';
import 'package:hundredsentences/YeniSayfam.dart';

class YeniSayfa extends StatelessWidget {
  //const YeniSayfa({Key? key}) : super(key: key);

  final YeniSayfam yeniSayfam;
  const YeniSayfa({Key? key, required this.yeniSayfam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: Text("Examples"),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Card(
                  color: Colors.amberAccent,
                  elevation: 6,
                  child: Text(
                    yeniSayfam.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Card(
                  //color: Colors.green,
                  color: Colors.amberAccent,
                  child: Text(
                    yeniSayfam.description,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
