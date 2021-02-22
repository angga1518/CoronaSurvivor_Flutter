part of 'widgets.dart';

class Calendar extends StatelessWidget {
  final int startRed;
  final int endRed;
  final int startYellow;
  final int endYellow;
  final int recoverDate;
  final bool clickable;

  Calendar(this.startRed, this.endRed, this.startYellow, this.endYellow,
      this.recoverDate,
      {this.clickable = false});

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
      (clickable) ? generateClickableDate() : generateDate(); 
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
              ? UIHelper.colorMainRed
              : (date >= startYellow && date <= endYellow)
                  ? UIHelper.colorMainYellow
                  : null,
        ),
        child: Center(
          child: Text(
            (date).toString(),
            style: (date >= startRed && date <= endYellow)
                ? UIHelper.whiteFont
                    .copyWith(fontSize: UIHelper.setResFontSize(15))
                : UIHelper.greyLightFont
                    .copyWith(fontSize: UIHelper.setResFontSize(15)),
          ),
        ),
      ));

      date++;
    }
  }

  void generateClickableDate() {
    DateTime now = DateTime.now();
    int lastDate = DateTime(now.year, now.month + 1, 0).day;
    int countDaysThisMonth = lastDate;
    int countDaysNextMonth = DateTime(now.year, now.month + 2, 0).day;
    int firstRedWeekDay = DateTime(now.year, now.month, startRed).weekday;
    int dayNeedToPassed = generateDayNeedToPassed();
    int date = startRed;
    int dateFront = startRed;
    for (var i = 1; i <= lastDate + countDaysNextMonth; i++) {
      if (dateFront > countDaysThisMonth) {
        dateFront = 1;
      }
      if (i <= dayNeedToPassed) {
        continue;
      }
      if (date > recoverDate) {
        break;
      }
      if (i < firstRedWeekDay + dayNeedToPassed) {
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
              (dateFront).toString(),
              style: UIHelper.greyLightFont
                  .copyWith(fontSize: UIHelper.setResFontSize(15)),
            ),
          ),
        ));
        date++;
        dateFront++;
        continue;
      }
      component.add(Container(
        height: UIHelper.setResHeight(32),
        width: UIHelper.setResWidth(32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: (date >= startRed && date <= endRed)
              ? UIHelper.colorMainRed
              : (date >= startYellow && date <= endYellow)
                  ? UIHelper.colorMainYellow
                  : null,
        ),
        child: Center(
          child: Text(
            (dateFront).toString(),
            style: (date >= startRed && date <= endYellow)
                ? UIHelper.whiteFont
                    .copyWith(fontSize: UIHelper.setResFontSize(15))
                : UIHelper.greyLightFont
                    .copyWith(fontSize: UIHelper.setResFontSize(15)),
          ),
        ),
      ));

      date++;
      dateFront++;
    }
  }

  int generateDayNeedToPassed() {
    int count = 0;
    for (var i = 1; i < startRed; i = i + 7) {
      count++;
    }
    count--;
    return count * 7;
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
