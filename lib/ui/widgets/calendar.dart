part of 'widgets.dart';

class Calendar extends StatelessWidget {
  final int startRed;
  final int endRed;
  final int startYellow;
  final int endYellow;
  final int recoverDate;

  Calendar(this.startRed, this.endRed, this.startYellow, this.endYellow,
      this.recoverDate);

  List<Widget> component = [];
  List<String> days = [
    "Mo",
    "Tu",
    "We",
    "Th",
    "Fr",
    "Sa",
    "Su",
  ];

  @override
  Widget build(BuildContext context) {
    if (component.length == 0) {
      generateDay();
      generateDate();
    }
    return Wrap(
      spacing: UIHelper.setResWidth(10),
      runSpacing: UIHelper.setResHeight(10),
      children: component,
    );
  }

  void generateDay() {
    for (var i = 0; i < days.length; i++) {
      component.add(Container(
        height: UIHelper.setResHeight(32),
        width: UIHelper.setResWidth(32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            days[i],
            style: UIHelper.greyLightFont.copyWith(
                fontSize: UIHelper.setResFontSize(15),
                fontWeight: FontWeight.w700),
          ),
        ),
      ));
    }
  }

  void generateDate() {
    DateTime now = DateTime.now();
    int lastDate = DateTime(now.year, now.month + 1, 0).day;
    int firstWeekDay = DateTime(now.year, now.month, 1).weekday;
    int date = 1;
    for (var i = 0; i < lastDate; i++) {
      if (i + 1 < firstWeekDay) {
        component.add(Container(
          height: UIHelper.setResHeight(32),
          width: UIHelper.setResWidth(32),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
          ),
        ));
        lastDate++;
        continue;
      }
      if (date == recoverDate) {
        component.add(Container(
          height: UIHelper.setResHeight(32),
          width: UIHelper.setResWidth(32),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: UIHelper.colorMainGreen, width: 2)),
          child: Center(
            child: Text(
              (date).toString(),
              style: UIHelper.greyLightFont
                  .copyWith(fontSize: UIHelper.setResFontSize(15)),
            ),
          ),
        ));
        date++;
        continue;
      }
      component.add(Container(
        height: UIHelper.setResHeight(32),
        width: UIHelper.setResWidth(32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: (date >= startRed && date <= endRed)
              ? UIHelper.colorMainRed.withOpacity(0.25)
              : (date >= startYellow && date <= endYellow)
                  ? UIHelper.colorMainYellow.withOpacity(0.20)
                  : null,
        ),
        child: Center(
          child: Text(
            (date).toString(),
            style: UIHelper.greyLightFont
                .copyWith(fontSize: UIHelper.setResFontSize(15)),
          ),
        ),
      ));

      date++;
    }
  }

  void generetDummy() {
    for (var i = 0; i < 31; i++) {
      component.add(Container(
        height: UIHelper.setResHeight(32),
        width: UIHelper.setResWidth(32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: UIHelper.colorMainRed.withOpacity(0.25),
        ),
        child: Center(
          child: Text(
            (i + 1).toString(),
            style: UIHelper.greyLightFont
                .copyWith(fontSize: UIHelper.setResFontSize(15)),
          ),
        ),
      ));
    }
  }

  void cleanComponent() {
    component = [];
  }

  String getDayFromIndex(int firstDateWeekday) {
    switch (firstDateWeekday) {
      case 1:
        return "Mo";
        break;
      case 2:
        return "Tu";
        break;
      case 3:
        return "We";
        break;
      case 4:
        return "Th";
        break;
      case 5:
        return "Fr";
        break;
      case 6:
        return "Sa";
        break;
      default:
        return "Su";
    }
  }
}
