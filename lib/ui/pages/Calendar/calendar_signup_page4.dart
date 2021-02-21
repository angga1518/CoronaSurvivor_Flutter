part of '../pages.dart';

class CalendarSignUpPage4 extends StatefulWidget {
  @override
  CalendarSignUpPage4State createState() => CalendarSignUpPage4State();
}

class CalendarSignUpPage4State extends State<CalendarSignUpPage4> {
  @override
  Widget build(BuildContext context) {
    return CalendarSignUpTemplate(
      Container(),
      desc: "Masukkan riwayat penyakit yang Anda miliki",
      backTo: GoToCalendarSignUpPage3(),
      goTo: GoToCalendarSignUpPage5(),
    );
  }
}