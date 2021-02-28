part of '../pages.dart';

class ConnectPuskesPage extends StatefulWidget {
  CalendarModel calendar;
  ConnectPuskesPage(this.calendar);
  @override
  _ConnectPuskesPageState createState() => _ConnectPuskesPageState();
}

class _ConnectPuskesPageState extends State<ConnectPuskesPage> {
  TextEditingController kodeController = TextEditingController();
  bool isKodeValid = true;
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return CalendarDefaultTemplate(
      SizedBox(
        child: TextFieldWidget(
          "Kode Puskesmas",
          "Kode Puskesmas",
          (value) {},
          false,
          controller: kodeController,
          isValid: isKodeValid,
          errorText: "Kode tidak valid",
        ),
      ),
      addHeader: true,
      header: "Hubungkan Dengan Puskesmas",
      desc: "Masukkan kode puskesmas",
      backTo: GoToCalendarHome(widget.calendar),
      goTo: null,
      pinkButtonTitle: "Kirim",
      onPinkButtonTap: () async {
        // proses
        showPopUp(context: context, child: PopUpLoadingChild());
        bool valid = await CalendarService.connectToKodePuskesmas(
                kodeController.text, widget.calendar.nomorKalender)
            .whenComplete(() => Navigator.pop(context));
        print(valid);
        if (!valid) {
          kodeController.clear();
          showPopUp(
              context: context,
              child: PopUpChild(
                "Mohon Maaf",
                "Kode puskesmas yang anda input tidak valid",
                null,
                null,
                custom: true,
                height: 180,
                child: Column(
                  children: [
                    PinkButton("Kembali", () {
                      Navigator.pop(context);
                    }, height: 36, width: 58, fontSize: 11)
                  ],
                ),
              ));
          return;
        }
        widget.calendar.kodePuskesmas = kodeController.text;
        pageBloc.add(GoToSuccessPage(
            message:
                "MyCalendar Anda berhasil terhubung dengan Puskesmas! Laporan Anda selanjutnya akan diberikan feedback oleh pihak puskesmas",
            goTo: GoToCalendarHome(widget.calendar),
            pinkButtonMessage: "Kembali ke MyCalendar",
            backTo: GoToCalendarHome(widget.calendar)));
      },
    );
  }
}
