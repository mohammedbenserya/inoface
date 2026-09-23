import '../../../../table_calendar/src/customization/calendar_style.dart';
import 'package:inoface/core/usecases/constants.dart';
import '../../../../table_calendar/src/table_calendar.dart';
import '../../../../table_calendar/src/shared/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/agenda/agenda_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';


class CalendarAgenda extends StatefulWidget {
  final int idPersonne;
  const CalendarAgenda({
    Key? key,
    required this.idPersonne,
  }) : super(key: key);

  @override
  _CalendarAgendaState createState() => _CalendarAgendaState();
}

class _CalendarAgendaState extends State<CalendarAgenda> {

  late CalendarFormat _calendarFormat;
  final now = DateTime.now();
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    _calendarFormat = CalendarFormat.week;
    _selectedDay = agendaLogic.state.dateTimeLocal;
    _focusedDay = agendaLogic.state.dateTimeLocal;
    super.initState();
  }

  @override
  void dispose() {
    agendaState.events.clear();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final events = agendaState.events;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 16, left: 4, right: 4),
      child: TableCalendar(
        locale: 'fr_FR',
        firstDay: now.subtract(const Duration(days: 360)),
        lastDay: now.add(const Duration(days: 360)),
        startingDayOfWeek: StartingDayOfWeek.monday,
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
          final event = events.firstWhereOrNull((element) => element.date_agenda == parsedDate);
          return (event != null) ? [event] : [];
        },
        availableCalendarFormats: const {
          CalendarFormat.month: 'Semaine',
          CalendarFormat.twoWeeks: 'Mois',
          CalendarFormat.week: '2 Semaines',
        },
        calendarStyle: CalendarStyle(
          tablePadding: const EdgeInsets.only(bottom: 8),
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
            agendaLogic.updateDateTime(selectedDay);
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            // if (!mounted) return;
            context.read<AgendaBloc>().add(AgendWs(
              date: DateFormat('yyyy-MM-dd').format(selectedDay),
              idPersonne: widget.idPersonne,
            ));
          }
        },
      )
    );
  }
}