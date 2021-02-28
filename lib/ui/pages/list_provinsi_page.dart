part of 'pages.dart';

class ListProvinsiPage extends StatefulWidget {
  @override
  _ListProvinsiPageState createState() => _ListProvinsiPageState();
}

class _ListProvinsiPageState extends State<ListProvinsiPage> {
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
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
                      CardContainer(
                          "Data Provinsi",
                          (sharedListKasusProvinsi == null)
                              ? FutureBuilder(
                                  future: CovidInfoService.getInfoProvinsi(),
                                  builder: (_, snapshot) {
                                    if (snapshot.hasData) {
                                      List<KasusProvinsi> listKasusProvinsi =
                                          snapshot.data as List<KasusProvinsi>;
                                      sharedListKasusProvinsi =
                                          listKasusProvinsi;
                                      List<Widget> children = [];
                                      for (KasusProvinsi kasusProvinsi
                                          in listKasusProvinsi) {
                                        children.add(ListNavigationContainer(
                                          "dummy",
                                          "dummy",
                                          kasusProvinsi.provinsi,
                                          () {
                                            generateDetail(kasusProvinsi);
                                          },
                                          isProfil: false,
                                        ));
                                        children.add(UIHelper.vertSpace(10));
                                      }
                                      return Column(
                                        children: children,
                                      );
                                    } else {
                                      return Container(
                                        child: Center(
                                            child: SpinKitThreeBounce(
                                                color:
                                                    UIHelper.colorMainLightRed,
                                                size:
                                                    UIHelper.setResWidth(20))),
                                      );
                                    }
                                  })
                              : generateList()),
                      UIHelper.vertSpace(18),
                      UIHelper.vertSpace(20),
                    ],
                  )
                ],
              ),
              TopBar("Statistik Covid Provinsi", () {
                pageBloc.add(GoToHomePage());
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget generateList() {
    List<Widget> children = [];
    for (KasusProvinsi kasusProvinsi in sharedListKasusProvinsi) {
      children.add(ListNavigationContainer(
        "dummy",
        "dummy",
        kasusProvinsi.provinsi,
        () {
          generateDetail(kasusProvinsi);
        },
        isProfil: false,
      ));
      children.add(UIHelper.vertSpace(10));
    }
    return Column(
      children: children,
    );
  }

  void generateDetail(KasusProvinsi kasusProvinsi) {
    showPopUp(
        context: context,
        child: PopUpChild(
          "Statistik Covid",
          "Provinsi ${kasusProvinsi.provinsi}",
          null,
          null,
          custom: true,
          height: 330,
          child: Column(
            children: [
              UIHelper.vertSpace(10),
              Container(
                width: UIHelper.setResWidth(239),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: UIHelper.colorPinkSuperLight, width: 2)),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: UIHelper.setResWidth(10)),
                      width: UIHelper.setResWidth(140),
                      child: Text(kasusProvinsi.positif.toString(),
                          style: UIHelper.redFont.copyWith(
                              fontSize: UIHelper.setResFontSize(25),
                              fontWeight: FontWeight.w700)),
                    ),
                    Text("Orang Positif",
                        style: UIHelper.redFont.copyWith(
                            fontSize: UIHelper.setResFontSize(12),
                            fontWeight: FontWeight.w400))
                  ],
                ),
              ),
              UIHelper.vertSpace(10),
              Container(
                width: UIHelper.setResWidth(239),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: UIHelper.colorPinkSuperLight, width: 2)),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: UIHelper.setResWidth(10)),
                      width: UIHelper.setResWidth(140),
                      child: Text(kasusProvinsi.sembuh.toString(),
                          style: UIHelper.greenFont.copyWith(
                              fontSize: UIHelper.setResFontSize(25),
                              fontWeight: FontWeight.w700)),
                    ),
                    Text("Orang Sembuh",
                        style: UIHelper.greenFont.copyWith(
                            fontSize: UIHelper.setResFontSize(12),
                            fontWeight: FontWeight.w400))
                  ],
                ),
              ),
              UIHelper.vertSpace(10),
              Container(
                width: UIHelper.setResWidth(239),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: UIHelper.colorPinkSuperLight, width: 2)),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: UIHelper.setResWidth(10)),
                      width: UIHelper.setResWidth(140),
                      child: Text(kasusProvinsi.meninggal.toString(),
                          style: UIHelper.yellowFont.copyWith(
                              fontSize: UIHelper.setResFontSize(25),
                              fontWeight: FontWeight.w700)),
                    ),
                    Text("Orang Meninggal",
                        style: UIHelper.yellowFont.copyWith(
                            fontSize: UIHelper.setResFontSize(12),
                            fontWeight: FontWeight.w400))
                  ],
                ),
              ),
              UIHelper.vertSpace(10),
              PinkButton("Kembali", () {
                Navigator.pop(context);
              }, height: 36, width: 58, fontSize: 11)
            ],
          ),
        ));
  }
}
