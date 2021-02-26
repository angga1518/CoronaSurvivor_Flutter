part of 'pages.dart';

class PlasmaPage extends StatefulWidget {
  @override
  _PlasmaPageState createState() => _PlasmaPageState();
}

class _PlasmaPageState extends State<PlasmaPage> {
  int infoIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    infoIndex = 0;
    pageController = PageController(initialPage: infoIndex);
  }

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    // List<DataPenerima> lisDataPenerima =
    //     PlasmaServices.getAllSavedDataPenerima();

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
                    UIHelper.vertSpace(113),
                    FutureBuilder(
                        future: Future.wait(
                            [PlasmaServices.getAllSavedDataPenerima()]),
                        builder:
                            (context, AsyncSnapshot<List<dynamic>> snapshot) {
                          if (snapshot.hasData) {
                            var allPenerima = snapshot.data[0]; //bar
                            // var allPendonor = snapshot.data[1];
                            return Container(
                                height: UIHelper.height -
                                    UIHelper.setResHeight(185),
                                child: PageView(
                                  onPageChanged: (index) {
                                    setState(() {
                                      infoIndex = index;
                                    });
                                  },
                                  physics: NeverScrollableScrollPhysics(),
                                  controller: pageController,
                                  children: [
                                    generateListPenerima(),
                                    generateNotFound()
                                  ],
                                ));
                          } else {
                            // kasih sp
                            return Container(
                              child: Text("hi"),
                            );
                          }
                        })
                  ],
                ),
                Column(
                  children: [
                    TopBar("Plasma", () {}),
                    Container(
                      height: UIHelper.setResHeight(45),
                      decoration: BoxDecoration(
                          color: UIHelper.colorDarkWhite,
                          border: Border.symmetric(
                              vertical: BorderSide(
                                  color: UIHelper.colorMediumLightGrey,
                                  width: 1))),
                      child: Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              if (infoIndex == 1) {
                                pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              }
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                    height: UIHelper.setResHeight(41),
                                    child: Center(
                                        child: Text("Penerima",
                                            style: (infoIndex == 0)
                                                ? UIHelper.redFont.copyWith(
                                                    fontSize:
                                                        UIHelper.setResFontSize(
                                                            16),
                                                    fontWeight: FontWeight.w700)
                                                : UIHelper.greyLightFont
                                                    .copyWith(
                                                        color: UIHelper
                                                            .colorGreySuperLight,
                                                        fontSize: UIHelper
                                                            .setResFontSize(16),
                                                        fontWeight:
                                                            FontWeight.w400)))),
                                (infoIndex == 0)
                                    ? Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height: 2,
                                          color: UIHelper.colorMainRed,
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          )),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              if (infoIndex == 0) {
                                pageController.nextPage(
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeIn);
                              }
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                    height: UIHelper.setResHeight(41),
                                    child: Center(
                                        child: Text("Pendonor",
                                            style: (infoIndex == 1)
                                                ? UIHelper.redFont.copyWith(
                                                    fontSize:
                                                        UIHelper.setResFontSize(
                                                            16),
                                                    fontWeight: FontWeight.w700)
                                                : UIHelper.greyLightFont
                                                    .copyWith(
                                                        color: UIHelper
                                                            .colorGreySuperLight,
                                                        fontSize: UIHelper
                                                            .setResFontSize(16),
                                                        fontWeight:
                                                            FontWeight.w400)))),
                                (infoIndex == 1)
                                    ? Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height: 2,
                                          color: UIHelper.colorMainRed,
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          ))
                        ],
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomBar(2),
                )
              ],
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: FloatingActionButton.extended(
              elevation: 0,
              backgroundColor: UIHelper.colorMainLightRed,
              foregroundColor: UIHelper.colorMainRed,
              onPressed: () {
                // Respond to button press
                pageBloc.add(GoToPlasmaPenerimaSignUp1());
              },
              icon: Icon(Icons.add),
              label: Text(
                "Tambah Pendonor",
                style: UIHelper.greyFont.copyWith(
                    fontSize: UIHelper.setResFontSize(11),
                    fontWeight: FontWeight.w700,
                    color: UIHelper.colorMainRed),
                textAlign: TextAlign.center,
              ),
            ),
          )),
    );
  }
}

Widget generateListPenerima() {
  return Container(
      child: ListView(
    children: [
      UIHelper.vertSpace(15),
      Text(
        "Daftar Seluruh Pendonor",
        style: UIHelper.darkGreyFont,
        textAlign: TextAlign.center,
      ),
      UIHelper.vertSpace(15),
      Table(
        columnWidths: {
          2: FlexColumnWidth(2),
          3: FlexColumnWidth(2),
          4: FlexColumnWidth(2),
          5: FlexColumnWidth(0.5),
        },
        children: [
          TableRow(
            children: [
              generateJudulTabel("Gol"),
              generateJudulTabel("L/P"),
              generateJudulTabel("Tgl Lahir"),
              generateJudulTabel("Tgl Negatif"),
              generateJudulTabel("Domisili"),
              generateJudulTabel(" ")
            ],
          ),
          TableRow(children: [
            generateGolonganDarah("O(-)"),
            generateNormalText("P"),
            generateNormalText("30/03/2000"),
            generateNormalText("30/03/2000"),
            generateNormalText("Jakarta"),
            generateIcon()
          ])
        ],
      )
    ],
  ));
}

Widget generateIcon() {
  return Container(
    height: UIHelper.setResHeight(50),
    width: UIHelper.setResWidth(UIHelper.width),
    child: Align(
        alignment: Alignment.center,
        child: Icon(
          Icons.navigate_next,
          color: UIHelper.colorGreySuperLight,
          size: 24.0,
          semanticLabel: 'Text to announce in accessibility modes',
        )),
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(width: 1, color: UIHelper.colorGreySuperLight2),
        // bottom: BorderSide(width: 1, color: UIHelper.colorGreySuperLight2),
      ),
      color: Colors.white,
    ),
  );
}

Widget generateNormalText(String tulisan) {
  return Container(
    height: UIHelper.setResHeight(50),
    width: UIHelper.setResWidth(UIHelper.width),
    child: Align(
      alignment: Alignment.center,
      child: Text(
        tulisan,
        style: UIHelper.greyFont.copyWith(
            fontSize: UIHelper.setResFontSize(11),
            fontWeight: FontWeight.w500,
            color: UIHelper.colorGreyLight),
        textAlign: TextAlign.center,
      ),
    ),
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(width: 1, color: UIHelper.colorGreySuperLight2),
        // bottom: BorderSide(width: 1, color: UIHelper.colorGreySuperLight2),
      ),
      color: Colors.white,
    ),
  );
}

Widget generateGolonganDarah(String tulisan) {
  return Container(
    height: UIHelper.setResHeight(50),
    width: UIHelper.setResWidth(UIHelper.width),
    child: Align(
      alignment: Alignment.center,
      child: Text(
        tulisan,
        style: UIHelper.greyFont.copyWith(
            fontSize: UIHelper.setResFontSize(11),
            fontWeight: FontWeight.w700,
            color: UIHelper.colorMainRed),
        textAlign: TextAlign.center,
      ),
    ),
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(width: 1, color: UIHelper.colorGreySuperLight2),
        // bottom: BorderSide(width: 1, color: UIHelper.colorGreySuperLight2),
      ),
      color: Colors.white,
    ),
  );
}

Widget generateJudulTabel(String namaJudul) {
  return Container(
    height: UIHelper.setResHeight(50),
    width: UIHelper.setResWidth(UIHelper.width),
    child: Align(
      alignment: Alignment.center,
      child: Text(
        namaJudul,
        style: UIHelper.greyFont.copyWith(
            fontSize: UIHelper.setResFontSize(13), fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,
      ),
    ),
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(width: 1, color: UIHelper.colorGreySuperLight2),
        // bottom: BorderSide(width: 1, color: UIHelper.colorGreySuperLight2),
      ),
      color: Colors.white,
    ),
  );
}

Widget generateNotFound() {
  return Container(
    child: ListView(
      children: [
        UIHelper.vertSpace(15),
        // generateSearchBar(),
        UIHelper.vertSpace(15),
        Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(22, 21, 22, 21),
                child: Column(
                  children: [
                    Center(
                      child: Image(
                        image: AssetImage("assets/not_found.png"),
                        width: UIHelper.setResWidth(50),
                        height: UIHelper.setResHeight(50),
                      ),
                    ),
                    UIHelper.vertSpace(10),
                    SizedBox(
                      width: UIHelper.setResWidth(210),
                      child: Text(
                        "Tidak ada info yang ditemukan. Coba kata kunci lain.",
                        style: UIHelper.greyFont,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          width: UIHelper.setResWidth(322),
          margin: EdgeInsets.only(left: 19, right: 19),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
        ),
        UIHelper.vertSpace(15),
      ],
    ),
  );
}
