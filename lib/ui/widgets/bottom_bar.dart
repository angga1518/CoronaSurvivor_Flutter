part of 'widgets.dart';

class BottomBar extends StatelessWidget {
  final int index;
  final Pengguna pengguna;

  BottomBar(this.index, this.pengguna);

  PageBloc pageBloc;

  List<String> assets = [
    "assets/house.png",
    "assets/checklist.png",
    "assets/megaphone.png",
    "assets/calendar.png"
  ];
  List<String> active_assets = [
    "assets/house_active.png",
    "assets/checklist_active.png",
    "assets/megaphone_active.png",
    "assets/calendar_active.png"
  ];
  List<String> titles = ["Home", "Plasma", "Info", "MyCalendar"];

  List<Function> listOnTap;

  @override
  Widget build(BuildContext context) {
    pageBloc = BlocProvider.of<PageBloc>(context);
    listOnTap = [
      () {
        pageBloc.add(GoToHomePage());
      },
      () {
        // pageBloc.add(GoToProfilePage());
      },
      () {
        pageBloc.add(GoToInfoPage());
      },
      () async {
        CalendarModel calendar = sharedCalendar;
        if (calendar == null) {
          pageBloc.add(GoToCalendarOnboardPage(pengguna));
        } else {
          calendar.pengguna = pengguna;
          pageBloc.add(GoToCalendarHome(calendar));
        }
      },
    ];
    return Container(
        height: UIHelper.setResHeight(55),
        decoration: BoxDecoration(
            color: UIHelper.colorSoftWhite,
            border: Border(
              top: BorderSide(
                  width: 1,
                  color: UIHelper.colorMediumDarkGrey.withOpacity(0.1)),
            )),
        child: Padding(
          padding: EdgeInsets.only(top: UIHelper.setResHeight(10)),
          child: Row(children: generateSubMenu()),
        ));
  }

  List<Widget> generateSubMenu() {
    List<Widget> listSubMenu = [];
    for (var i = 0; i < titles.length; i++) {
      String asset = assets[i];
      String title = titles[i];
      Color color = UIHelper.colorGreySuperLight;
      if (index == i + 1) {
        asset = active_assets[i];
        color = UIHelper.colorMainRed;
      }
      listSubMenu.add(Expanded(
          child: GestureDetector(
        onTap: () {
          listOnTap[i]();
        },
        child: Column(
          children: [
            SizedBox(
              height: UIHelper.setResHeight(24),
              width: UIHelper.setResWidth(24),
              child: Image(image: AssetImage(asset)),
            ),
            Text(title,
                style: UIHelper.redFont.copyWith(
                    color: color,
                    fontSize: UIHelper.setResFontSize(10),
                    fontWeight: FontWeight.w700))
          ],
        ),
      )));
    }
    return listSubMenu;
  }
}
