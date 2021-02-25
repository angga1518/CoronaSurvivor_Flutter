part of '../pages.dart';

class ConnectPuskesPage extends StatefulWidget {
  @override
  _ConnectPuskesPageState createState() => _ConnectPuskesPageState();
}

class _ConnectPuskesPageState extends State<ConnectPuskesPage> {
  TextEditingController kodeController = TextEditingController();
  bool isKodeValid = true;
  @override
  Widget build(BuildContext context) {
    return CalendarDefaultTemplate(
      SizedBox(
        child: TextFieldWidget(
          "Kode Puskesmas",
          "Kode Puskesmas",
          (value) {
            kodeController.text = value;
          },
          false,
          isValid: isKodeValid,
          errorText: "Kode tidak valid",
        ),
      ),
      addHeader: true,
      header: "Hubungkan Dengan Puskesmas",
      desc: "Masukkan kode puskesmas",
      backTo: GoToCalendarHome(),
      goTo: GoToSuccessPage(
          message:
              "MyCalendar Anda berhasil terhubung dengan Puskesmas Depok! Laporan Anda selanjutnya akan diberikan feedback oleh pihak puskesmas",
          goTo: GoToCalendarHome(),
          pinkButtonMessage: "Kembali ke MyCalendar",
          backTo: GoToCalendarHome()
          ),
      pinkButtonTitle: "Kirim",
      onPinkButtonTap: () {},
    );
  }
}
