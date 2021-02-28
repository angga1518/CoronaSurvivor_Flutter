part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();

  @override
  List<Object> get props => [];
}

class LoadCalendar extends CalendarEvent {
  final String emailPengguna;
  LoadCalendar({@required this.emailPengguna});
}

class LoadLocalCalendar extends CalendarEvent {
  final CalendarModel calendar;
  LoadLocalCalendar({@required this.calendar});
}

