import 'package:inoface/features/jours_feries/models/jours_feries_model.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import '../../../../table_calendar/src/customization/calendar_style.dart';
import '../../../../table_calendar/src/customization/header_style.dart';
import 'package:inoface/core/usecases/constants.dart';
import '../../../../table_calendar/src/table_calendar.dart';
import '../../../../table_calendar/src/shared/utils.dart';
import '../../../../core/util/generateMaterialColor.dart';
import '../../../../core/database/app_database.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:after_layout/after_layout.dart';
import '../../../../core/util/app_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';



class LoadedJoursFeries extends StatefulWidget {
  final int? id;
  final int idPersonne;
  final JoursFeriesModel model;
  const LoadedJoursFeries({
    Key? key,
    this.id,
    required this.model,
    required this.idPersonne,
  }) : super(key: key);

  @override
  State<LoadedJoursFeries> createState() => _LoadedJoursFeriesState();
}

class _LoadedJoursFeriesState extends State<LoadedJoursFeries> with
    TickerProviderStateMixin, AfterLayoutMixin<LoadedJoursFeries> {

  late List<JoursFerie> _selectedEvents;
  bool isClicked = false;
  // DateTime? _dateTimed;

  late CalendarFormat _calendarFormat;
  final now = DateTime.now();
  late DateTime _selectedDay;
  late DateTime _focusedDay;


  @override
  void initState() {
    if (widget.id != null) {
      JoursFery? jour = widget.model.joursFeries.firstWhereOrNull((element) => element.id_jours_feries == widget.id);
      if (jour != null && jour.date_debut_jour_ferie != null) {
        _selectedDay = jour.date_debut_jour_ferie!;
        _focusedDay = jour.date_debut_jour_ferie!;
        final date = DateTime.parse(DateFormat('yyyy-MM-dd').format(_selectedDay));
        _selectedEvents = joursFeriesLogic.events[date] ?? [];
        _selectedEvents.isNotEmpty ? isClicked = true : isClicked = false;
      } else {
        _selectedDay = now;
        _focusedDay = now;
      }
    } else {
      _selectedDay = now;
      _focusedDay = now;
    }
    _calendarFormat = CalendarFormat.month;
    final format = DateFormat('yyyy-MM-dd').format(now);
    var parsedDate = DateTime.parse('$format 00:00:00.000');
    _selectedEvents = joursFeriesLogic.events[parsedDate] ?? [];
    super.initState();
  }

  Future<void> _decrementCounter() async {
    await utilsLogic.updateCounter(idPer: widget.idPersonne);
  }

  @override
  void dispose() {
    joursFeriesLogic.events.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final events = joursFeriesLogic.events;
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        image: const DecorationImage(
          image: AssetImage(AppImage.bg),
          fit: BoxFit.cover,
          opacity: 0.6,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(bottom: 16, left: 4, right: 4),
                  child: TableCalendar(
                    locale: 'fr_FR',
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    firstDay: now.subtract(const Duration(days: 360)),
                    lastDay: now.add(const Duration(days: 360)),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    eventLoader: (day) {
                      final format = DateFormat('yyyy-MM-dd').format(day);
                      var parsedDate = DateTime.parse('$format 00:00:00.000');
                      final event = events[parsedDate];
                      return (event != null) ? event : [];
                    },
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Semaine',
                      CalendarFormat.twoWeeks: 'Mois',
                      CalendarFormat.week: '2 Semaines',
                    },
                    calendarStyle: CalendarStyle(
                      markerDecoration: BoxDecoration(
                        color: Colors.brown[700],
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.pink[200],
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.pink[400],
                        shape: BoxShape.circle,
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonTextStyle: const TextStyle().copyWith(
                          color: Colors.white, fontSize: 15.0),
                      formatButtonDecoration: BoxDecoration(
                        color: Colors.pink[400],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (DateTime selectedDay, DateTime focusedDay) async {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;

                          final date = DateTime.parse(DateFormat('yyyy-MM-dd').format(selectedDay));
                          _selectedEvents = events[date] ?? [];
                          _selectedEvents.isNotEmpty ? isClicked = true : isClicked = false;

                        });

                        if (_selectedEvents.isNotEmpty) {
                          for(var val in _selectedEvents) {
                            await utilsLogic.viewJourFeriesById(idPer: widget.idPersonne, idJour: val.id_jours_feries);
                          }
                          _decrementCounter();
                        }
                      }
                    },
                  )
                ),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 20),
                  children: _selectedEvents.map((element) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              AutoSizeText('start_date'.tr, maxLines: 1),
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Icon(MdiIcons.calendar,
                                      color: Colors.pink,
                                    ),
                                    const SizedBox(width: 8,),
                                    if (element.date_debut_jour_ferie != null)
                                      Text(utilsLogic.convertDate(element.date_debut_jour_ferie!)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              AutoSizeText('end_date'.tr, maxLines: 1),
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(MdiIcons.calendar,
                                      color: Colors.pink,
                                    ),
                                    const SizedBox(width: 8,),
                                    if (element.date_fin_jour_ferie != null)
                                      Text(utilsLogic.convertDate(element.date_fin_jour_ferie!))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Divider(color: Colors.pink,),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: AutoSizeText(
                              "${element.description_jour_ferie}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          )
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    if (_selectedEvents.isNotEmpty) {
      for (var val in _selectedEvents) {
        await utilsLogic.viewJourFeriesById(
          idPer: widget.idPersonne,
          idJour: val.id_jours_feries,
        );
      }
      await _decrementCounter();
    }
  }

}

/*
class BuildJoursFeries extends StatefulWidget {
  final int idPersonne;
  Map<DateTime, List<JoursFerie>> events = {};
  BuildJoursFeries({
    required this.events,
    required this.idPersonne,
    Key? key
}) : super(key: key);

  @override
  _BuildJoursFeriesState createState() => _BuildJoursFeriesState();
}

class _BuildJoursFeriesState extends State<BuildJoursFeries> with
    TickerProviderStateMixin, AfterLayoutMixin<BuildJoursFeries> {

  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  final dateFormatter = DateFormat('dd/MM/yyyy');
  late AnimationController _animationController;
  List<JoursFerie> _selectedEvents = [];
  bool isClicked = false;
  DateTime? _dateTimed;

  @override
  void initState() {
    DateTime datePlan = dateFormatter.parse(formattedDate);
    _selectedEvents = widget.events[datePlan] ?? [];
    _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    if (_selectedEvents.isNotEmpty) {
      for(var val in _selectedEvents) {
        await utilsLogic.viewJourFeriesById(idPer: widget.idPersonne, idJour: val.id_jours_feries);
      }
      _decrementCounter();
    }
  }

  _decrementCounter() async {
    final countsModel = await utilsLogic.getCounter(idPer: widget.idPersonne);
    if (!mounted) return;
    utilsLogic.setMainCountsModel(countsModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: context.isPhone ? ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  color: Colors.white,
                  // color: Colors.amber[50],
                  child: _buildTableCalendar(),
                ),
              ),
              _buildEventList2(),
              const SizedBox(height: 20.0),
            ],
          ) : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                width: context.width/2,
                height: context.height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    color: Colors.white,
                    // color: Colors.amber[50],
                    child: _buildTableCalendar(),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  children: <Widget>[
                    _buildEventList2(),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget _buildTableCalendar() {
    final now = DateTime.now();
    return TableCalendar(
      locale: 'fr_FR',
      firstDay: now,
      lastDay: now.add(const Duration(days: 1000)),
      focusedDay: now,
      eventLoader: (day) {
        return widget.events[day] ?? [];
      },
      calendarFormat: context.isPhone ? CalendarFormat.week : CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Semaine',
        CalendarFormat.twoWeeks: 'Mois',
        CalendarFormat.week: '2 Semaines',
      },
      calendarStyle: CalendarStyle(
        markerDecoration: BoxDecoration(
          color: Colors.brown[700],
        ),
        todayDecoration: BoxDecoration(
          color: Colors.pink[200],
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.pink[400],
        ),
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle: const TextStyle().copyWith(
            color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.pink[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: (DateTime selectedDay, DateTime focusedDay) async {
        setState(() {
          _selectedEvents = widget.events[selectedDay] ?? [];
          _selectedEvents.isNotEmpty ? isClicked = true : isClicked = false;
          _dateTimed = selectedDay;
        });
        if (_selectedEvents.isNotEmpty) {
          for(var val in _selectedEvents) {
            await utilsLogic.viewJourFeriesById(idPer: widget.idPersonne, idJour: val.id_jours_feries);
          }
          _decrementCounter();
        }
      },
    );
  }

  Widget _buildEventList2() {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 20),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: _selectedEvents.map((element) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Material(
                elevation: 2,
                shadowColor: Colors.grey,
                child: Container(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          AutoSizeText('start_date'.tr,
                            maxLines: 1,
                          ),
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(MdiIcons.calendar,
                                  color: Colors.pink,
                                ),
                                const SizedBox(width: 8,),
                                if (element.date_debut_jour_ferie != null)
                                  Text(utilsLogic.convertDate(element.date_debut_jour_ferie!)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          AutoSizeText('end_date'.tr,
                            maxLines: 1,
                          ),
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(MdiIcons.calendar,
                                  color: Colors.pink,
                                ),
                                const SizedBox(width: 8,),
                                if (element.date_fin_jour_ferie != null)
                                  Text(utilsLogic.convertDate(element.date_fin_jour_ferie!))
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Divider(color: Colors.pink,),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: AutoSizeText(
                          "${element.description_jour_ferie}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),

                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
 */