part of 'widgets.dart';

class RecoveryTemplate extends StatelessWidget {
  final PageEvent backTo;
  final Function onPinkButtonTap;
  // dd-MM-YYYY
  final String date;
  final bool withPinkButton;
  final double space;
  final bool isPinkButtonEnabled;
  final Widget child;

  RecoveryTemplate(
      {@required this.child,
      @required this.date,
      @required this.backTo,
      this.space = 34,
      this.onPinkButtonTap,
      this.withPinkButton = true,
      this.isPinkButtonEnabled = true});

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    int year = int.parse(date.split("-")[2]);
    int month = int.parse(date.split("-")[1]);
    int day = int.parse(date.split("-")[0]);
    DateTime realDate = DateTime(year, month, day);
    String hari = getHariFromIndex(realDate.weekday);
    String bulan = getBulanFromIndex(month);

    return WillPopScope(
      onWillPop: () async {
        pageBloc.add(backTo);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                color: UIHelper.colorDarkWhite,
              ),
              ListView(
                children: [
                  Column(
                    children: [
                      UIHelper.vertSpace(88),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: UIHelper.setResWidth(10),
                              vertical: UIHelper.setResHeight(10)),
                          width: UIHelper.setResWidth(322),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: UIHelper.setResWidth(32),
                                    height: UIHelper.setResHeight(32),
                                    decoration: BoxDecoration(
                                      color: UIHelper.colorMainRed,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Center(
                                      child: Text(
                                        day.toString(),
                                        style: UIHelper.whiteFont.copyWith(
                                            fontSize:
                                                UIHelper.setResFontSize(15)),
                                      ),
                                    ),
                                  ),
                                  UIHelper.horzSpace(13),
                                  Text(
                                    "$hari, $day $bulan $year",
                                    style: UIHelper.darkGreyFont.copyWith(
                                        fontSize: UIHelper.setResFontSize(15),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              UIHelper.vertSpace(space),
                              child
                            ],
                          )),
                      UIHelper.vertSpace(20),
                      (withPinkButton)
                          ? PinkButton(
                              "Simpan",
                              () {
                                onPinkButtonTap();
                              },
                              isEnabled: isPinkButtonEnabled,
                            )
                          : Container(),
                      (withPinkButton) ? UIHelper.vertSpace(70) : Container(),
                    ],
                  )
                ],
              ),
              TopBar("MyCalendar", () {
                pageBloc.add(backTo);
              }),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomBar(4),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getHariFromIndex(int index) {
    switch (index) {
      case 1:
        return "Senin";
        break;
      case 2:
        return "Selasa";
        break;
      case 3:
        return "Rabu";
        break;
      case 4:
        return "Kamis";
        break;
      case 5:
        return "Jumat";
        break;
      case 6:
        return "Sabtu";
        break;
      case 7:
        return "Minggu";
        break;
    }
  }

  String getBulanFromIndex(int index) {
    switch (index) {
      case 1:
        return "Januari";
        break;
      case 2:
        return "Februaru";
        break;
      case 3:
        return "Maret";
        break;
      case 4:
        return "April";
        break;
      case 5:
        return "Mei";
        break;
      case 6:
        return "Juni";
        break;
      case 7:
        return "Juli";
        break;
      case 8:
        return "Agustus";
        break;
      case 9:
        return "September";
        break;
      case 10:
        return "Oktober";
        break;
      case 11:
        return "November";
        break;
      case 12:
        return "Desember";
        break;
    }
  }
}
