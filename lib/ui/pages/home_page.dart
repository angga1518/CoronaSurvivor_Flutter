part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return WillPopScope(
      onWillPop: () async {
        pageBloc.add(GoToOnboardPage());
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
                      Wrap(
                        spacing: 7,
                        runSpacing: 7,
                        children: [
                          Container(
                            height: UIHelper.responsive.setHeight(75),
                            width: UIHelper.responsive.setWidth(135),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: UIHelper.colorSoftPink, width: 2)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("1,134,854",
                                    style: UIHelper.redFont.copyWith(
                                        fontSize: UIHelper.responsive.setSp(25),
                                        fontWeight: FontWeight.w700)),
                                Text("Orang Positif",
                                    style: UIHelper.redFont.copyWith(
                                        fontSize: UIHelper.responsive.setSp(12),
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                          Container(
                            height: UIHelper.responsive.setHeight(75),
                            width: UIHelper.responsive.setWidth(135),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: UIHelper.colorSoftPink, width: 2)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("176,672",
                                    style: UIHelper.blueFont.copyWith(
                                        fontSize: UIHelper.responsive.setSp(25),
                                        fontWeight: FontWeight.w700)),
                                Text("Orang Dirawat",
                                    style: UIHelper.blueFont.copyWith(
                                        fontSize: UIHelper.responsive.setSp(12),
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                          Container(
                            height: UIHelper.responsive.setHeight(75),
                            width: UIHelper.responsive.setWidth(135),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: UIHelper.colorSoftPink, width: 2)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("926,980",
                                    style: UIHelper.greenFont.copyWith(
                                        fontSize: UIHelper.responsive.setSp(25),
                                        fontWeight: FontWeight.w700)),
                                Text("Orang Positif",
                                    style: UIHelper.greenFont.copyWith(
                                        fontSize: UIHelper.responsive.setSp(12),
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                          Container(
                            height: UIHelper.responsive.setHeight(75),
                            width: UIHelper.responsive.setWidth(135),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: UIHelper.colorSoftPink, width: 2)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("1,134,854",
                                    style: UIHelper.yellowFont.copyWith(
                                        fontSize: UIHelper.responsive.setSp(25),
                                        fontWeight: FontWeight.w700)),
                                Text("Orang Positif",
                                    style: UIHelper.yellowFont.copyWith(
                                        fontSize: UIHelper.responsive.setSp(12),
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          )
                        ],
                      )),
                  UIHelper.vertSpace(18),
                  CardContainer(
                      "Status Covid-19 Daerah Anda",
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: UIHelper.responsive.setWidth(73),
                                height: UIHelper.responsive.setHeight(32),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: UIHelper.colorMainLightRed),
                                child: Center(
                                  child: Text("High",
                                      style: UIHelper.redFont.copyWith(
                                          fontSize:
                                              UIHelper.responsive.setSp(12),
                                          fontWeight: FontWeight.w700)),
                                ),
                              ),
                              UIHelper.horzSpace(17),
                              RichText(
                                text: TextSpan(
                                  text: 'Kelurahan Beji\n',
                                  style: UIHelper.greyFont.copyWith(
                                      fontSize: UIHelper.responsive.setSp(13),
                                      fontWeight: FontWeight.w700),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Provinsi DKI Jakarta',
                                        style: UIHelper.greyFont.copyWith(
                                            fontSize:
                                                UIHelper.responsive.setSp(13),
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          UIHelper.vertSpace(25),
                          Text("Provinsi DKI Jakarta",
                              style: UIHelper.greyLightFont.copyWith(
                                  color: UIHelper.colorGreySuperLight,
                                  fontSize: UIHelper.responsive.setSp(13),
                                  fontWeight: FontWeight.w500)),
                          UIHelper.vertSpace(10),
                          Container(
                            width: UIHelper.responsive.setWidth(239),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: UIHelper.colorPinkSuperLight,
                                    width: 2)),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: UIHelper.responsive.setWidth(10)),
                                  width: UIHelper.responsive.setWidth(140),
                                  child: Text("289612",
                                      style: UIHelper.redFont.copyWith(
                                          fontSize:
                                              UIHelper.responsive.setSp(25),
                                          fontWeight: FontWeight.w700)),
                                ),
                                Text("Orang Positif",
                                    style: UIHelper.redFont.copyWith(
                                        fontSize: UIHelper.responsive.setSp(12),
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                          UIHelper.vertSpace(10),
                          Container(
                            width: UIHelper.responsive.setWidth(239),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: UIHelper.colorPinkSuperLight,
                                    width: 2)),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: UIHelper.responsive.setWidth(10)),
                                  width: UIHelper.responsive.setWidth(140),
                                  child: Text("260986",
                                      style: UIHelper.greenFont.copyWith(
                                          fontSize:
                                              UIHelper.responsive.setSp(25),
                                          fontWeight: FontWeight.w700)),
                                ),
                                Text("Orang Positif",
                                    style: UIHelper.greenFont.copyWith(
                                        fontSize: UIHelper.responsive.setSp(12),
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                          UIHelper.vertSpace(10),
                          Container(
                            width: UIHelper.responsive.setWidth(239),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: UIHelper.colorPinkSuperLight,
                                    width: 2)),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: UIHelper.responsive.setWidth(10)),
                                  width: UIHelper.responsive.setWidth(140),
                                  child: Text("4529",
                                      style: UIHelper.yellowFont.copyWith(
                                          fontSize:
                                              UIHelper.responsive.setSp(25),
                                          fontWeight: FontWeight.w700)),
                                ),
                                Text("Orang Positif",
                                    style: UIHelper.yellowFont.copyWith(
                                        fontSize: UIHelper.responsive.setSp(12),
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                          UIHelper.vertSpace(10),
                          BlueNavigation("Lihat lokasi lainnya"),
                        ],
                      )),
                  UIHelper.vertSpace(18),
                  LogoCardContainer(
                    "Status Covid-19 Daerah Anda",
                    "assets/pin_gps.png",
                    "Aktifkan GPS Anda untuk melihat status Covid-19 di daerah Anda",
                    "Aktifkan",
                    29,
                    62,
                    nextMessage: "Lihat lokasi lainnya",
                  ),
                  UIHelper.vertSpace(18),
                  LogoCardContainer(
                      "MyCalendar",
                      "assets/mask_myCalendar.png",
                      "Anda terjangkit covid-19? Gunakan MyCalendar untuk mencatat perkembangan Anda",
                      "Buat MyCalendar",
                      29,
                      104),
                  UIHelper.vertSpace(18),
                  CardContainer("MyCalendar", null),
                  UIHelper.vertSpace(20),
                ],
              ),
              Container(
                height: UIHelper.responsive.setHeight(68),
                color: Colors.white,
                child: Row(
                  children: [
                    UIHelper.horzSpace(23),
                    GestureDetector(
                      onTap: () {
                        pageBloc.add(GoToProfilePage());
                      },
                      child: Container(
                        height: UIHelper.responsive.setHeight(32),
                        width: UIHelper.responsive.setWidth(32),
                        decoration: BoxDecoration(
                          color: UIHelper.colorSoftPink,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: SizedBox(
                            child: Image(
                              image: AssetImage("assets/user.png"),
                              height: UIHelper.responsive.setHeight(20),
                              width: UIHelper.responsive.setWidth(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    UIHelper.horzSpace(56),
                    Logo(39, 15, 18, 148)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
