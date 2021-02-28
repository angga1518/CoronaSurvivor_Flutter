part of 'widgets.dart';

class Calendar extends StatelessWidget {
  final CalendarModel calendar;
  int startMonth;
  int startYear;
  int startRed;
  int endRed;
  int startYellow;
  int endYellow;
  int recoverDate;
  final bool clickable;

  Calendar(this.calendar, {this.clickable = false}) {
    String tanggal = getTanggalFormatted(calendar.tanggalStartRed);
    startRed = int.parse(tanggal.split("/")[0]);
    startMonth = int.parse(tanggal.split("/")[1]);
    startYear = int.parse(tanggal.split("/")[2]);
    int redDuration = calendar.red;
    int yellowDuration = calendar.yellow;
    endRed = startRed + redDuration - 1;
    startYellow = startRed + redDuration;
    endYellow = startRed + redDuration + yellowDuration - 1;
    recoverDate = startRed + redDuration + yellowDuration;
  }

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

  PageBloc pageBloc;

  @override
  Widget build(BuildContext context) {
    pageBloc = BlocProvider.of<PageBloc>(context);
    if (component.length == 0) {
      generateDay();
      (clickable) ? generateClickableDate(context) : generateDate();
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
    int lastDate = DateTime(startYear, startMonth + 1, 0).day;
    int firstWeekDay = DateTime(startYear, startMonth, 1).weekday;
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

  void generateClickableDate(BuildContext context) {
    int lastDate = DateTime(startYear, startMonth + 1, 0).day;
    int countDaysThisMonth = lastDate;
    int countDaysNextMonth = DateTime(startYear, startMonth + 2, 0).day;
    int firstRedWeekDay = DateTime(startYear, startMonth, startRed).weekday;
    int dayNeedToPassed = generateDayNeedToPassed();
    int date = startRed;
    int dateFront = startRed;
    int changeMonth = 0;
    for (var i = 1; i <= lastDate + countDaysNextMonth; i++) {
      if (dateFront > countDaysThisMonth) {
        dateFront = 1;
        changeMonth++;
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
        component
            .add(generateRecoverDateContainer(context, changeMonth, dateFront));
        date++;
        dateFront++;
        continue;
      }
      component.add(generateDateContainer(context, changeMonth, dateFront));
      date++;
      dateFront++;
    }
  }

  Widget generateRecoverDateContainer(
      BuildContext context, int changeMonth, int date) {
    return GestureDetector(
      onTap: () {
        onTap(context, changeMonth, date);
      },
      child: Container(
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
      ),
    );
  }

  Widget generateDateContainer(
      BuildContext context, int changeMonth, int date) {
    return GestureDetector(
      onTap: () {
        onTap(context, changeMonth, date);
      },
      child: Container(
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
      ),
    );
  }

  void onTap(BuildContext context, int changeMonth, int dateFront) async {
    if (calendar.lastDate == null) {
      // set default value
      DateTime tanggalMunculGejala =
          getDateTimeFromStringTanggal(calendar.tanggalMunculGejala)
              .subtract(Duration(days: 1));
      calendar.lastDate = getTanggalFormatted(
          getTanggalFromDateTime(tanggalMunculGejala) + "T");
    }
    String lastDateCalendar = getTanggalFormatted(calendar.lastDate);
    print(lastDateCalendar);
    DateTime lastDateTime = DateTime(
        int.parse(lastDateCalendar.split("/")[2]),
        int.parse(lastDateCalendar.split("/")[1]),
        int.parse(lastDateCalendar.split("/")[0]));

    DateTime nowDateTime = DateTime.now();

    DateTime tempDateTime = lastDateTime.add(Duration(days: 1));
    String lastDateCalendarPlusOne =
        DateFormat('dd/MM/yyyy').format(tempDateTime);
    DateTime selectedDate =
        DateTime(startYear, startMonth + changeMonth, dateFront);
    calendar.selectedDate = selectedDate;

    if (lastDateTime.isBefore(nowDateTime)) {
      showPopUp(
          context: context,
          child: PopUpChild(
            "Anda belum mengisi progres Anda di hari sebelumnya",
            "Isi progres Anda di tanggal $lastDateCalendarPlusOne terlebih dahulu",
            null,
            null,
            custom: true,
            height: 210,
            child: Column(
              children: [
                PinkButton("Isi", () {
                  Navigator.pop(context);
                  pageBloc.add(GoToRecoveryOnBoardPage(calendar));
                }, height: 36, width: 58, fontSize: 11)
              ],
            ),
          ));
    } else {
      if (selectedDate.isAfter(lastDateTime)) {
        showPopUp(
            context: context,
            child: PopUpChild(
              "Detail belum tersedia",
              "Detail baru tersedia hingga tanggal $lastDateCalendar",
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
      } else {
        showPopUp(context: context, child: PopUpLoadingChild());
        Recovery recovery = await RecoveryService.getRecovery(
                calendar.nomorKalender, getTanggalFromDateTime(selectedDate))
            .whenComplete(() => Navigator.pop(context));
        pageBloc.add(GoToRecoveryDetailPage(calendar, recovery));
      }
    }
  }

  int generateDayNeedToPassed() {
    int count = 0;
    for (var i = 1; i < startRed; i = i + 7) {
      count++;
    }
    if (startRed > 1) {
      count--;
    }
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
