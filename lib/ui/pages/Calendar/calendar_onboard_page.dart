part of '../pages.dart';

class CalendarOnboardPage extends StatefulWidget {
  CalendarModel calendarModel;
  Pengguna pengguna;
  CalendarOnboardPage(this.pengguna, {this.calendarModel});
  @override
  _CalendarOnboardPageState createState() => _CalendarOnboardPageState();
}

class _CalendarOnboardPageState extends State<CalendarOnboardPage> {
  @override
  Widget build(BuildContext context) {
    CalendarModel calendar =
        (widget.calendarModel == null) ? CalendarModel() : widget.calendarModel;
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    TextEditingController kodePuskesmasController =
        TextEditingController(text: calendar.kodePuskesmas);
    return WillPopScope(
      onWillPop: () async {
        pageBloc.add(GoToHomePage());
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
                        width: UIHelper.setResWidth(320),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            UIHelper.vertSpace(10),
                            SizedBox(
                              height: UIHelper.setResHeight(110),
                              width: UIHelper.setResWidth(110),
                              child: Image(
                                  image:
                                      AssetImage("assets/mask_myCalendar.png")),
                            ),
                            UIHelper.vertSpace(20),
                            SizedBox(
                              width: UIHelper.setResWidth(200),
                              child: Text(
                                "Anda terjangkit covid-19? Gunakan MyCalendar untuk mencatat perkembangan Anda",
                                style: UIHelper.greyLightFont.copyWith(
                                    fontSize: UIHelper.setResFontSize(12)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            UIHelper.vertSpace(25),
                            PinkButton(
                              "+ Buat MyCalendar",
                              () async {
                                await showPopUp(
                                    context: context,
                                    child: PopUpChild(
                                        "Apakah Anda benar - benar terjangkit covid-19?",
                                        "MyCalendar dapat digunakan oleh penderita covid-19 untuk mencatat perkembangannya setiap hari.",
                                        () {
                                      Navigator.pop(context);
                                    }, () async {
                                      Navigator.pop(context);
                                      calendar.pengguna = widget.pengguna;
                                      calendar.kodePuskesmas =
                                          kodePuskesmasController.text;
                                      pageBloc.add(
                                          GoToCalendarSignUpPage1(calendar));
                                    }));
                              },
                              fontSize: UIHelper.setResFontSize(10),
                              height: UIHelper.setResHeight(30),
                              width: UIHelper.setResWidth(150),
                            ),
                            UIHelper.vertSpace(30),
                            // BlueNavigation(
                            //   "Lihat selengkapnya",
                            //   () {},
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            // ),
                            // UIHelper.vertSpace(20),
                          ],
                        ),
                      ),
                      UIHelper.vertSpace(20),
                    ],
                  )
                ],
              ),
              TopBar(
                "MyCalendar",
                () {
                  pageBloc.add(GoToHomePage());
                },
                helpButton: true,
                onTapHelp: () {},
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserLoaded) {
                        Pengguna pengguna = state.pengguna;
                        return BottomBar(4, pengguna);
                      }
                      return Container();
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
