part of '../pages.dart';

class ConnectPuskesPage extends StatefulWidget {
  @override
  _ConnectPuskesPageState createState() => _ConnectPuskesPageState();
}

class _ConnectPuskesPageState extends State<ConnectPuskesPage> {
  @override
  Widget build(BuildContext context) {
    return CalendarDefaultTemplate(
      SizedBox(),
      addHeader: true,
      header: "Hubungkan Dengan Puskesmas",
      desc: "Masukkan kode puskesmas",
      backTo: GoToCalendarHome(),
      goTo: null,
      pinkButtonTitle: "Kirim",
    );
  }
}