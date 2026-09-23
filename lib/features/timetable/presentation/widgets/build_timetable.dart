import 'package:inoface/core/util/generateMaterialColor.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:flutter/material.dart';



class BuildTimetable extends StatelessWidget {
  final List<Seance> seance;
  const BuildTimetable({
    Key? key,
    required this.seance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      itemCount: seance.length,
      itemBuilder: (context, index) {
        bool isMatiere = seance[index].matiere != null;
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            children: [
              Container(
                color: primaryColor,
                width: 95,
                height: 66,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "${seance[index].horaire_debut}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${seance[index].horaire_fin}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 66,
                  padding: const EdgeInsets.all(6),
                  color: Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          isMatiere ? '${seance[index].matiere}' : '${seance[index].horaire_tranches_type}',
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        );
      },
    );
  }
}
