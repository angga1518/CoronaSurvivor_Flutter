part of '../pages.dart';

class CalendarSignUpPage5 extends StatefulWidget {
  CalendarModel calendarModel;
  CalendarSignUpPage5(this.calendarModel);
  @override
  CalendarSignUpPage5State createState() => CalendarSignUpPage5State();
}

class CalendarSignUpPage5State extends State<CalendarSignUpPage5> {
  bool isSetuju = false;
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return CalendarDefaultTemplate(
      SizedBox(
        child: generateCheckBox(
            title:
                "Saya menyatakan bahwa seluruh data yang saya masukkan benar adanya dan saya bertanggungjawab penuh atas kebenaran data - data tersebut",
            value: isSetuju,
            onChange: (value) {
              setState(() {
                isSetuju = value;
              });
            }),
      ),
      space: 5,
      addHeader: false,
      onPinkButtonTap: () async {
        showPopUp(context: context, child: PopUpLoadingChild());
        DateTime dateTime = DateTime.now();
        String tanggalDibuat = DateFormat('yyyy-MM-dd').format(dateTime);
        widget.calendarModel.tanggalDibuat = tanggalDibuat;
        String noCalendar =
            await CalendarService.createCalendar(widget.calendarModel);
        widget.calendarModel.nomorKalender = noCalendar;
        widget.calendarModel =
            await GejalaService.createGejala(widget.calendarModel)
                .whenComplete(() => Navigator.pop(context));
        pageBloc.add(GoToCalendarHome(widget.calendarModel));
      },
      backTo: GoToCalendarSignUpPage4(widget.calendarModel),
      goTo: null,
      isEnabled: isSetuju,
    );
  }
}
