import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/usecases/enums.dart';
import '../../../../core/util/generateMaterialColor.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../main.dart';
import 'package:get/get.dart';




class AgendaNotes extends StatelessWidget {
  final int idAgenda;
  AgendaNotes({Key? key, required this.idAgenda}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      builder: (_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('notes'.tr),
        ),
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<AgendaNote>>(
                stream: appDatabase.agendaNotesDao.watchAllAgendaNoteById(idAgenda),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      List<AgendaNote> notes = snapshot.data ?? [];
                      if (notes.isEmpty) {
                        return const SizedBox.shrink();
                      } else {
                        return ListView(
                          reverse: true,
                          children: notes.map((element) {
                            return Container(
                              child: (element.send ?? false)
                                  ? FutureBuilder<PersonneNote?>(
                                future: appDatabase.personneNotesDao.getAllPersonneNoteById(element.id_agenda_note),
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    default:
                                      if (snapshot.hasData) {
                                        return ChatMessage(
                                          send: true,
                                          type: snapshot.data!.prenom!,
                                          msg: element.note,
                                          date: element.date_agenda_note!,
                                          sender: "${snapshot.data?.nom ?? ""} ${snapshot.data?.prenom ?? ''}",
                                        );
                                      } else {
                                        return FutureBuilder<Personne?>(
                                            future: appDatabase.personnesDao.getPersonne(),
                                            builder: (context, snapPersonne) {
                                              switch (snapPersonne.connectionState) {
                                                case ConnectionState.none:
                                                case ConnectionState.waiting:
                                                  return const Center(
                                                    child: CircularProgressIndicator(
                                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                                    ),
                                                  );
                                                default:
                                                  if (snapPersonne.hasData) {
                                                    return ChatMessage(
                                                      send: true,
                                                      type: snapPersonne.data!.prenom!,
                                                      msg: element.note,
                                                      date: element.date_agenda_note!,
                                                      sender:
                                                      "${snapPersonne.data?.nom ?? ""} ${snapshot.data?.prenom ?? ''}",
                                                    );
                                                  } else {
                                                    return const SizedBox.shrink();
                                                  }
                                              }
                                            });
                                      }
                                  }
                                },
                              )
                                  : FutureBuilder<PersonneNote?>(
                                future: appDatabase.personneNotesDao.getAllPersonneNoteById(element.id_agenda_note),
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    default:
                                      if (snapshot.hasData) {
                                        return ChatMessage(
                                          send: false,
                                          type: snapshot.data!.prenom!,
                                          msg: element.note,
                                          date: element.date_agenda_note!,
                                          sender: "${snapshot.data?.nom ?? ""} ${snapshot.data?.prenom ?? ''}",
                                        );
                                      } else {
                                        return FutureBuilder<Personne?>(
                                            future: appDatabase.personnesDao.getPersonne(),
                                            builder: (context, snapPersonne) {
                                              switch (snapPersonne.connectionState) {
                                                case ConnectionState.none:
                                                case ConnectionState.waiting:
                                                  return const Center(
                                                    child: CircularProgressIndicator(
                                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                                    ),
                                                  );
                                                default:
                                                  if (snapPersonne.hasData) {
                                                    return ChatMessage(
                                                      send: false,
                                                      type: snapPersonne.data!.prenom!,
                                                      msg: element.note,
                                                      date: element.date_agenda_note!,
                                                      sender: "${snapPersonne.data?.nom ?? ""} ${snapshot.data?.prenom ?? ''}",
                                                    );
                                                  } else {
                                                    return const SizedBox.shrink();
                                                  }
                                              }
                                            });
                                      }
                                  }
                                },
                              ),
                            );
                          }).toList(),
                        );
                      }
                  }
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              color: primaryColor,
              height: 60.0,
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 4),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value) {},
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration.collapsed(
                        hintText: 'send_msg'.tr,
                        hintStyle: const TextStyle(
                          color: Colors.white70,
                        )
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    iconSize: 25.0,
                    color: Colors.white,
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        utilsLogic.sendNotes(
                          msg: _controller.text.trim(),
                          idAgenda: idAgenda,
                        );
                        _controller.clear();
                      } else {
                        utilsLogic.showSnack(
                          type: SnackBarType.info,
                          message: 'required_field'.tr,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final bool send;
  final String msg;
  final DateTime date;
  final String type;
  final String sender;
  const ChatMessage({
    this.msg = '',
    required this.date,
    required this.type,
    required this.send,
    required this.sender,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final db = Provider.of<AppDatabase>(context);
    return FutureBuilder<Personne?>(
      future: appDatabase.personnesDao.getPersonne(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            if (snapshot.hasData) {
              final personne = snapshot.data!;
              return Row(
                mainAxisAlignment: type == personne.prenom ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: <Widget>[
                  Card(
                    color: type == personne.prenom ? Colors.green.shade100 : Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          type != personne.prenom
                              ? AutoSizeText(
                                  sender,
                                  textAlign: TextAlign.start,
                                  style: subTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink,
                                    fontSize: 12,
                                  ),
                                  maxLines: 1,
                                )
                              : const SizedBox.shrink(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 90,
                            child: HtmlWidget(msg),
                          ),
                          const SizedBox(height: 5),
                          send
                              ? AutoSizeText(
                                  utilsLogic.convertDateNotes(date),
                                  style: subTextStyle.copyWith(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                  maxLines: 1,
                                )
                              : Icon(
                                  MdiIcons.clockAlert,
                                  size: 14,
                                  color: Colors.grey,
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
        }
      },
    );
  }
}
