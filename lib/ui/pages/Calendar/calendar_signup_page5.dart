part of '../pages.dart';

class CalendarSignUpPage5 extends StatefulWidget {
  @override
  CalendarSignUpPage5State createState() => CalendarSignUpPage5State();
}

class CalendarSignUpPage5State extends State<CalendarSignUpPage5> {
  bool isSetuju = false;
  @override
  Widget build(BuildContext context) {
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
      backTo: GoToCalendarSignUpPage4(),
      goTo: null,
      isEnabled: isSetuju,
    );
  }
}
