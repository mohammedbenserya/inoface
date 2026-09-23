import 'package:inoface/features/devoir/bloc/devoir_bloc.dart';
import '../../../../table_calendar/src/customization/calendar_style.dart';
import 'package:inoface/core/usecases/constants.dart';
import '../../../../table_calendar/src/table_calendar.dart';
import '../../../../table_calendar/src/shared/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/devoirs_dates_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';



class CalendarDevoir extends StatefulWidget {
  final DevoirsDatesModel model;
  final int idPersonne;
  const CalendarDevoir({
    required this.idPersonne,
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  _CalendarDevoirState createState() => _CalendarDevoirState();
}

class _CalendarDevoirState extends State<CalendarDevoir> {

  late CalendarFormat _calendarFormat;
  final now = DateTime.now();
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    _calendarFormat = CalendarFormat.week;
    _selectedDay = now;
    _focusedDay = now;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 16, left: 4, right: 4),
      child: TableCalendar(
        locale: 'fr_FR',
        firstDay: now.subtract(const Duration(days: 360)),
        lastDay: now.add(const Duration(days: 360)),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        startingDayOfWeek: StartingDayOfWeek.monday,
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
        eventLoader: (day) {
          final format = DateFormat('yyyy-MM-dd').format(day);
          var parsedDate = DateTime.parse('$format 00:00:00.000');
          final event = widget.model.dates.firstWhereOrNull((element) => element.dateDuDevoir == parsedDate);
          return (event != null) ? [event] : [];
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
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (DateTime selectedDay, DateTime focusedDay) async {
          if (!isSameDay(_selectedDay, selectedDay)) {
            devoirLogic.updateDateTime(selectedDay);
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            final input = devoirLogic.getInputDevoir(widget.idPersonne);
            context.read<DevoirBloc>().add(DevoirWs(input: input));
          }
        },
      ),
    );
  }
}
