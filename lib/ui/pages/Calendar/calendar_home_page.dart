part of '../pages.dart';

class CalendarHomePage extends StatefulWidget {
  CalendarModel calendarModel;
  CalendarHomePage(this.calendarModel);
  @override
  _CalendarHomePageState createState() => _CalendarHomePageState();
}

class _CalendarHomePageState extends State<CalendarHomePage> {
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return CalendarDefaultTemplate(
      SizedBox(
          child: Column(
        children: [
          UIHelper.vertSpace(5),
          Calendar(23, 28, 28 + 1, 28 + 5, 28 + 6, clickable: true),
          UIHelper.vertSpace(20),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: UIHelper.setResWidth(100),
                    child: Row(
                      children: [
                        Container(
                          height: UIHelper.setResHeight(12),
                          width: UIHelper.setResWidth(12),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: UIHelper.colorMainRed),
                        ),
                        UIHelper.horzSpace(7),
                        Text("Masa Isoman",
                            style: UIHelper.greyLightFont.copyWith(
                                fontSize: UIHelper.setResFontSize(12))),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: UIHelper.setResWidth(115),
                    child: Row(
                      children: [
                        Container(
                          height: UIHelper.setResHeight(12),
                          width: UIHelper.setResWidth(12),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: UIHelper.colorMainYellow),
                        ),
                        UIHelper.horzSpace(7),
                        Text("Masa Jaga Jarak",
                            style: UIHelper.greyLightFont.copyWith(
                                fontSize: UIHelper.setResFontSize(12))),
                      ],
                    ),
                  ),
                ],
              ),
              UIHelper.vertSpace(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: UIHelper.setResWidth(136),
                    child: Row(
                      children: [
                        Container(
                          height: UIHelper.setResHeight(12),
                          width: UIHelper.setResWidth(12),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: UIHelper.colorMainGreen),
                        ),
                        UIHelper.horzSpace(7),
                        Text("Sudah Tidak Menular",
                            style: UIHelper.greyLightFont.copyWith(
                                fontSize: UIHelper.setResFontSize(12))),
                      ],
                    ),
                  ),
                ],
              ),
              UIHelper.vertSpace(10),
              generateInfoContainer(
                  "Segera kontak tenaga kesehatan apabila saturasi Anda dibawah 95 atau Anda merasa sesak"),
              UIHelper.vertSpace(10),
              generateInfoContainer(
                  "Anda termasuk orang bergejala sedang. Menurut CDC, Anda tidak akan menular lagi setelah 10 hari isolasi mandiri.*\n\n*selama 10 hari Anda harus bebas dari demam tanpa bantuan obat demam."),
              UIHelper.vertSpace(15),
              Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Material(
                      color: UIHelper.colorPink,
                      child: InkWell(
                        splashColor: UIHelper.colorPinkLight,
                        onTap: () {
                          pageBloc.add(GoToConnectPuskesmasPage());
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: UIHelper.setResWidth(5)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Image(
                                    image: AssetImage("assets/hospital.png"),
                                    height: UIHelper.setResHeight(20),
                                    width: UIHelper.setResWidth(20),
                                  ),
                                ),
                                Text(
                                  "Hubungkan Dengan Puskesmas",
                                  style: UIHelper.redFont.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: UIHelper.setResFontSize(12),
                                      color: UIHelper.colorMainRed),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  child: Image(
                                    image:
                                        AssetImage("assets/forward_pink.png"),
                                    height: UIHelper.setResHeight(15),
                                    width: UIHelper.setResWidth(15),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  height: UIHelper.setResHeight(38),
                  width: UIHelper.setResWidth(238),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.white.withOpacity(0.05)),
                    ],
                    border: Border.all(color: UIHelper.colorMainLightRed),
                    borderRadius: BorderRadius.circular(10),
                  )),
              UIHelper.vertSpace(30),
              BlueNavigation("Lihat acuan CDC", () {})
            ],
          )
        ],
      )),
      space: 5,
      addHeader: false,
      backTo: GoToCalendarSignUpPage4(widget.calendarModel),
      goTo: null,
      withPinkButton: false,
    );
  }

  Widget generateInfoContainer(String desc) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: UIHelper.colorGreySuperLight2, width: 1)),
      padding: EdgeInsets.symmetric(
          horizontal: UIHelper.setResWidth(8),
          vertical: UIHelper.setResHeight(8)),
      width: UIHelper.setResWidth(297),
      child: Center(
        child: Text(desc,
            style: UIHelper.greyLightFont.copyWith(
                color: UIHelper.colorGreySuperLight,
                fontSize: UIHelper.setResFontSize(10)),
            textAlign: TextAlign.center),
      ),
    );
  }
}
