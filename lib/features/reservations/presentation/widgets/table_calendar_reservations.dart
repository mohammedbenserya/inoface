import 'package:inoface/features/reservations/logic/reservation_logic.dart';
import '../../../../table_calendar/src/customization/calendar_style.dart';
import '../../../../table_calendar/src/customization/header_style.dart';
import 'package:inoface/core/usecases/constants.dart';
import '../../../../table_calendar/src/table_calendar.dart';
import '../../../../table_calendar/src/shared/utils.dart';
import '../../cubit/reservation/reservations_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';




class TableCalendarReservations extends StatefulWidget {

  TableCalendarReservations({
    Key? key,
  }) : super(key: key);
  @override
  _TableCalendarReservationsState createState() => _TableCalendarReservationsState();
}

class _TableCalendarReservationsState extends State<TableCalendarReservations> with TickerProviderStateMixin {

  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  late AnimationController _animationController;
  final dateFormatter = DateFormat('dd/MM/yyyy');
  late CalendarFormat _calendarFormat;
  final now = DateTime.now();
  late DateTime _selectedDay;
  late DateTime _focusedDay;



  @override
  void initState() {
    super.initState();
    _selectedDay = now;
    _focusedDay = now;
    _calendarFormat = CalendarFormat.week;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    reservationLogic.events.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enfant = utilsState.enfant!;
    return GetBuilder<ReservationLogic>(
      builder: (logic) {
        final events = logic.events;
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
              final event = events.firstWhereOrNull((element) => element.date_cantine == parsedDate);
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
            headerStyle: HeaderStyle(
              formatButtonTextStyle: const TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
              formatButtonDecoration: BoxDecoration(
                color: Colors.pink[400],
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            onDaySelected: (DateTime selectedDay, DateTime focusedDay) async {
              if (!isSameDay(_selectedDay, selectedDay)) {
                reservationLogic.updateDateTime(selectedDay);
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
                final date = DateTime.parse(DateFormat('yyyy-MM-dd').format(selectedDay));
                context.read<ReservationsCubit>().getReservation(
                  idPersonne: enfant.id_personne,
                  date: date,
                );
              }
            },
          ),
        );
      },
    );
  }
}
