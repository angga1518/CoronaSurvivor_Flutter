part of 'pages.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  int infoIndex;
  PageController pageController;
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    infoIndex = 0;
    pageController = PageController(initialPage: infoIndex);
    textController = TextEditingController();
  }

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
                  UIHelper.vertSpace(113),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserLoaded) {
                        Pengguna pengguna = state.pengguna;
                        return FutureBuilder(
                            future: Future.wait([
                              ArtikelServices.getAllArtikel(pengguna.email),
                              ArtikelServices.getAllSavedArtikel(pengguna.email)
                            ]),
                            builder: (context,
                                AsyncSnapshot<List<dynamic>> snapshot) {
                              if (snapshot.hasData) {
                                var allArtikel = snapshot.data[0]; //bar
                                var savedArtikel = snapshot.data[1];
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
                                        // generateNotFound(),
                                        generatePortal(allArtikel, pengguna),
                                        savedArtikel != null
                                            ? generateSaved(
                                                savedArtikel, pengguna)
                                            : null,
                                      ],
                                    ));
                              } else {
                                // kasih sp
                                return Container();
                              }
                            });
                      } else {
                        return Container();
                      }
                    },
                  )
                ],
              ),
              Column(
                children: [
                  TopBar("Info", () {}),
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
                                      child: Text("Portal",
                                          style: (infoIndex == 0)
                                              ? UIHelper.redFont.copyWith(
                                                  fontSize:
                                                      UIHelper.setResFontSize(
                                                          16),
                                                  fontWeight: FontWeight.w700)
                                              : UIHelper.greyLightFont.copyWith(
                                                  color: UIHelper
                                                      .colorGreySuperLight,
                                                  fontSize:
                                                      UIHelper.setResFontSize(
                                                          16),
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
                                      child: Text("Disimpan",
                                          style: (infoIndex == 1)
                                              ? UIHelper.redFont.copyWith(
                                                  fontSize:
                                                      UIHelper.setResFontSize(
                                                          16),
                                                  fontWeight: FontWeight.w700)
                                              : UIHelper.greyLightFont.copyWith(
                                                  color: UIHelper
                                                      .colorGreySuperLight,
                                                  fontSize:
                                                      UIHelper.setResFontSize(
                                                          16),
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
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserLoaded) {
                        Pengguna pengguna = state.pengguna;
                        return BottomBar(3, pengguna);
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

  Widget generatePortal(List<Artikel> listArtikel, Pengguna pengguna) {
    List<Widget> children = [];

    for (Artikel artikel in listArtikel) {
      children.add(ArticleContainer(
          pengguna,
          artikel.idArtikel,
          artikel.judul,
          artikel.deskripsi,
          artikel.listIdComment != null ? artikel.listIdComment.length : 0,
          artikel.jumlahLike,
          artikel.imageUrl));
      children.add(
        UIHelper.vertSpace(10),
      );
    }

    return Container(
      child: ListView(
        children: [
          UIHelper.vertSpace(15),
          generateSearchBar(),
          UIHelper.vertSpace(15),
          CardContainer("", Column(children: children)),
          UIHelper.vertSpace(15),
        ],
      ),
    );
  }

  Widget generateSaved(List<Artikel> listArtikel, Pengguna pengguna) {
    List<Widget> children = [];
    if (listArtikel.length != 0) {
      for (Artikel artikel in listArtikel) {
        ArticleContainer articleContainer = new ArticleContainer(
            pengguna,
            artikel.idArtikel,
            artikel.judul,
            artikel.deskripsi,
            artikel.listIdComment != null ? artikel.listIdComment.length : 0,
            artikel.jumlahLike,
            artikel.imageUrl);
        children.add(articleContainer);
        children.add(
          UIHelper.vertSpace(10),
        );
      }
    } else {
      children.add(generateNotFoundSavedArtikel());
    }

    return Container(
      child: ListView(
        children: [
          UIHelper.vertSpace(15),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(22, 21, 22, 21),
                  child: Column(children: children),
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

  Widget generateNotFoundSavedArtikel() {
    return Container(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              width: UIHelper.setResWidth(300),
              child: Text(
                "Belum Ada Artikel Tersimpan",
                style: UIHelper.redFont.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            UIHelper.vertSpace(15),
            SizedBox(
              width: UIHelper.setResWidth(250),
              child: Text(
                "Ayo tambahkan artikel favorit anda!",
                style: UIHelper.greyFont,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        width: UIHelper.setResWidth(322),
        margin: EdgeInsets.only(left: 19, right: 19),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
      ),
    );
  }

  Widget generateNotFound() {
    return Container(
      child: ListView(
        children: [
          UIHelper.vertSpace(15),
          generateSearchBar(),
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

  Widget generateSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: UIHelper.setResWidth(5)),
      width: UIHelper.setResWidth(322),
      margin: EdgeInsets.only(left: 19, right: 19),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: TextField(
        style: UIHelper.greyLightFont.copyWith(
            color: UIHelper.colorGreySuperLight,
            fontSize: UIHelper.setResFontSize(13)),
        controller: textController,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: UIHelper.colorGreySuperLight,
            ),
            border: InputBorder.none,
            hintText: "Cari Informasi ...",
            hintStyle: UIHelper.greyLightFont.copyWith(
                color: UIHelper.colorGreySuperLight,
                fontSize: UIHelper.setResFontSize(13))),
      ),
    );
  }
}
