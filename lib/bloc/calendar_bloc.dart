import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:corona_survivor_flutter/models/models.dart';
import 'package:corona_survivor_flutter/services/services.dart';
import 'package:corona_survivor_flutter/shared/shared.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial());

  @override
  Stream<CalendarState> mapEventToState(
    CalendarEvent event,
  ) async* {
    if (event is LoadCalendar) {
      CalendarModel calendar =
          await CalendarService.getCalendarByEmail(event.emailPengguna);
      sharedCalendar = calendar;
      if (calendar == null) {
        yield CalendarInitial();
      } else {
        yield CalendarExisted(calendar);
      }
    }
    if (event is LoadLocalCalendar) {
      sharedCalendar = event.calendar;
      yield CalendarExisted(event.calendar);
    }
  }
}
