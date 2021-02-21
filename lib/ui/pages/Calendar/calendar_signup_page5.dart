part of '../pages.dart';

class CalendarSignUpPage5 extends StatefulWidget {
  @override
  CalendarSignUpPage5State createState() => CalendarSignUpPage5State();
}

class CalendarSignUpPage5State extends State<CalendarSignUpPage5> {
  @override
  Widget build(BuildContext context) {
    return CalendarSignUpTemplate(
      SizedBox(
        child: Column(
          children: [
            CheckboxListTile(
              value: true,
              onChanged: (value) {},
              title: Text(
                "Demam",
                style: UIHelper.greyLightFont
                    .copyWith(fontSize: UIHelper.setResFontSize(15)),
              ),
            )
          ],
        ),
      ),
      addHeader: false,
      backTo: GoToCalendarSignUpPage4(),
      goTo: null,
    );
  }
}
