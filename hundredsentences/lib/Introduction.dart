import 'package:flutter/material.dart';
import 'package:hundredsentences/Lists/introductionlisteleri.dart';
import 'package:hundredsentences/YeniSayfa.dart';
import 'package:hundredsentences/YeniSayfam.dart';

class Introduction extends StatelessWidget {
  //const Introduction({Key? key}) : super(key: key);

  final List<YeniSayfam> IntroDatalari = List.generate(
      Introduction_listeleri.categories.length,
      (index) => YeniSayfam(
          "${Introduction_listeleri.categories[index]}",
          "${Introduction_listeleri.idler[index]}",
          "${Introduction_listeleri.descriptions[index]}"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: Text("Introduction Templates"),
        backgroundColor: Colors.black12,
      ),
      body: ListView.builder(
        itemCount: IntroDatalari.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.amberAccent,
                  child: ListTile(
                    title: Text(
                      IntroDatalari[index].name,
                      textAlign: TextAlign.start,
                    ),
                    leading: SizedBox(
                      child: Text(IntroDatalari[index].id),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => YeniSayfa(
                                yeniSayfam: IntroDatalari[index],
                              )));
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
