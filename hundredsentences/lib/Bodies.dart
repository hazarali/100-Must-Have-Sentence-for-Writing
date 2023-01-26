import "package:flutter/material.dart";
import 'package:hundredsentences/Lists/bodieslists.dart';
import 'package:hundredsentences/YeniSayfa.dart';
import 'package:hundredsentences/YeniSayfam.dart';

class Bodies extends StatelessWidget {
  //const Bodies({Key? key}) : super(key: key);

  final List<YeniSayfam> BodyDatalari = List.generate(
      Bodies_lists.body_templates.length,
      (index) => YeniSayfam(
          "${Bodies_lists.body_templates[index]}",
          "${Bodies_lists.body_ids[index]}",
          "${Bodies_lists.body_descriptions[index]}"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange,
        appBar: AppBar(
          title: Text("Body Templates"),
          backgroundColor: Colors.black12,
        ),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          itemCount: BodyDatalari.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.amberAccent,
                    child: ListTile(
                      title: Text(
                        BodyDatalari[index].name,
                        textAlign: TextAlign.start,
                      ),
                      leading: SizedBox(
                        child: Text(BodyDatalari[index].id),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => YeniSayfa(
                                  yeniSayfam: BodyDatalari[index],
                                )));
                      },
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
