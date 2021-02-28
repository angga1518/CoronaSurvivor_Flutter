part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return WillPopScope(
      onWillPop: () async {
        // pageBloc.add(GoToOnboardPage());
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
                  UIHelper.vertSpace(88),
                  CardContainer(
                      "Status Covid-19 Indonesia",
                      (sharedCovidIndo == null)
                          ? FutureBuilder(
                              future: CovidInfoService.getInfoIndo(),
                              builder: (_, snapshot) {
                                // kalo null masuk ke else
                                if (snapshot.hasData) {
                                  CovidIndo covidIndo =
                                      snapshot.data as CovidIndo;
                                  sharedCovidIndo = covidIndo;
                                  return Column(
                                    children: [
                                      _generateCovidIndoWidget(
                                          covidIndo.positif,
                                          covidIndo.dirawat,
                                          covidIndo.sembuh,
                                          covidIndo.meninggal),
                                      UIHelper.vertSpace(10),
                                      BlueNavigation("Lihat Statistik Provinsi",
                                          () {
                                        pageBloc.add(GoToListProvinsi());
                                      }),
                                    ],
                                  );
                                } else {
                                  return Container(
                                    child: Center(
                                        child: SpinKitThreeBounce(
                                            color: UIHelper.colorMainLightRed,
                                            size: UIHelper.setResWidth(20))),
                                  );
                                }
                              })
                          : Column(
                              children: [
                                _generateCovidIndoWidget(
                                    sharedCovidIndo.positif,
                                    sharedCovidIndo.dirawat,
                                    sharedCovidIndo.sembuh,
                                    sharedCovidIndo.meninggal),
                                UIHelper.vertSpace(10),
                                BlueNavigation("Lihat Statistik Provinsi", () {
                                  pageBloc.add(GoToListProvinsi());
                                }),
                              ],
                            )),
                  UIHelper.vertSpace(18),
                  BlocBuilder<CalendarBloc, CalendarState>(
                    builder: (context, state) {
                      if (state is CalendarExisted) {
                        CalendarModel calendar = state.calendar;
                        return CardContainer(
                            "MyCalendar",
                            Column(
                              children: [
                                WarningBox(286,
                                    "Anda belum mengisi perkembangan Anda hari ini"),
                                UIHelper.vertSpace(14),
                                Calendar(
                                  calendar,
                                  clickable: false,
                                ),
                                UIHelper.vertSpace(10),
                                BlueNavigation("Lihat selengkapnya", () {
                                  pageBloc.add(GoToCalendarHome(calendar));
                                }),
                              ],
                            ));
                      }
                      return BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          if (state is UserLoaded) {
                            return LogoCardContainer(
                              "MyCalendar",
                              "assets/mask_myCalendar.png",
                              "Anda terjangkit covid-19? Gunakan MyCalendar untuk mencatat perkembangan Anda",
                              "Buat MyCalendar",
                              29,
                              104,
                              onMessageTap: () {
                                pageBloc.add(
                                    GoToCalendarOnboardPage(state.pengguna));
                              },
                            );
                          }
                          return Container(
                            child: Center(
                                child: SpinKitThreeBounce(
                                    color: UIHelper.colorMainLightRed,
                                    size: UIHelper.setResWidth(10))),
                          );
                        },
                      );
                    },
                  ),
                  UIHelper.vertSpace(75),
                ],
              ),
              Container(
                height: UIHelper.setResHeight(68),
                color: Colors.white,
                child: Row(
                  children: [
                    UIHelper.horzSpace(23),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        if (state is UserLoaded) {
                          return GestureDetector(
                            onTap: () {
                              pageBloc.add(GoToProfilePage(state.pengguna));
                            },
                            child: Container(
                              height: UIHelper.setResHeight(32),
                              width: UIHelper.setResWidth(32),
                              decoration: BoxDecoration(
                                color: UIHelper.colorSoftPink,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: SizedBox(
                                  child: Image(
                                    image: AssetImage("assets/user.png"),
                                    height: UIHelper.setResHeight(20),
                                    width: UIHelper.setResWidth(20),
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            child: Center(
                                child: SpinKitThreeBounce(
                                    color: UIHelper.colorMainLightRed,
                                    size: UIHelper.setResWidth(10))),
                          );
                        }
                      },
                    ),
                    UIHelper.horzSpace(56),
                    Logo(39, 15, 18, 148)
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserLoaded) {
                        Pengguna pengguna = state.pengguna;
                        return BottomBar(1, pengguna);
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

  Widget _generateCovidIndoWidget(
      String positif, String dirawat, String sembuh, String meninggal) {
    return Wrap(
      spacing: 7,
      runSpacing: 7,
      children: [
        Container(
          height: UIHelper.setResHeight(75),
          width: UIHelper.setResWidth(135),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: UIHelper.colorSoftPink, width: 2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(positif,
                  style: UIHelper.redFont.copyWith(
                      fontSize: UIHelper.setResFontSize(25),
                      fontWeight: FontWeight.w700)),
              Text("Orang Positif",
                  style: UIHelper.redFont.copyWith(
                      fontSize: UIHelper.setResFontSize(12),
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
        Container(
          height: UIHelper.setResHeight(75),
          width: UIHelper.setResWidth(135),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: UIHelper.colorSoftPink, width: 2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(dirawat,
                  style: UIHelper.blueFont.copyWith(
                      fontSize: UIHelper.setResFontSize(25),
                      fontWeight: FontWeight.w700)),
              Text("Orang Dirawat",
                  style: UIHelper.blueFont.copyWith(
                      fontSize: UIHelper.setResFontSize(12),
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
        Container(
          height: UIHelper.setResHeight(75),
          width: UIHelper.setResWidth(135),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: UIHelper.colorSoftPink, width: 2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(sembuh,
                  style: UIHelper.greenFont.copyWith(
                      fontSize: UIHelper.setResFontSize(25),
                      fontWeight: FontWeight.w700)),
              Text("Orang Sembuh",
                  style: UIHelper.greenFont.copyWith(
                      fontSize: UIHelper.setResFontSize(12),
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
        Container(
          height: UIHelper.setResHeight(75),
          width: UIHelper.setResWidth(135),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: UIHelper.colorSoftPink, width: 2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(meninggal,
                  style: UIHelper.yellowFont.copyWith(
                      fontSize: UIHelper.setResFontSize(25),
                      fontWeight: FontWeight.w700)),
              Text("Orang Meninggal",
                  style: UIHelper.yellowFont.copyWith(
                      fontSize: UIHelper.setResFontSize(12),
                      fontWeight: FontWeight.w400)),
            ],
          ),
        )
      ],
    );
  }
}
