part of 'pages.dart';

class DetailInfo extends StatefulWidget {
  final String idArtikel;
  final Pengguna pengguna;
  final String judul;

  DetailInfo(this.idArtikel, this.pengguna, this.judul);

  @override
  _DetailInfoState createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  PageBloc pageBloc;
  @override
  Widget build(BuildContext context) {
    pageBloc = BlocProvider.of<PageBloc>(context);
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
                        width: UIHelper.setResWidth(322),
                        margin: EdgeInsets.only(left: 19, right: 19),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: UIHelper.setResHeight(10)),
                              child: FutureBuilder(
                                future: Future.wait([
                                  ArtikelServices.getArtikelDetails(
                                      widget.idArtikel, widget.pengguna.email),
                                ]),
                                builder: (context,
                                    AsyncSnapshot<List<dynamic>> snapshot) {
                                  if (snapshot.hasData) {
                                    // snapshot.data[0]; //bar
                                    // snapshot.data[1];
                                    return Column(
                                      children: [
                                        SizedBox(
                                          width: UIHelper.setResWidth(250),
                                          child: Text(
                                            snapshot.data[0].judul,
                                            style: UIHelper.darkGreyFont
                                                .copyWith(
                                                    fontSize:
                                                        UIHelper.setResFontSize(
                                                            16)),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        UIHelper.vertSpace(20),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  UIHelper.setResWidth(15)),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                snapshot.data[0].institusi,
                                                style: UIHelper.greyLightFont
                                                    .copyWith(
                                                        fontSize: UIHelper
                                                            .setResFontSize(10),
                                                        color: UIHelper
                                                            .colorGreySuperLight),
                                                textAlign: TextAlign.center,
                                              )),
                                              Expanded(
                                                  child: Text(
                                                snapshot.data[0].author,
                                                style: UIHelper.greyLightFont
                                                    .copyWith(
                                                        fontSize: UIHelper
                                                            .setResFontSize(10),
                                                        color: UIHelper
                                                            .colorGreySuperLight),
                                                textAlign: TextAlign.center,
                                              )),
                                              Expanded(
                                                  child: Text(
                                                getTanggalForUI(snapshot
                                                    .data[0].tanggalPost),
                                                style: UIHelper.greyLightFont
                                                    .copyWith(
                                                        fontSize: UIHelper
                                                            .setResFontSize(10),
                                                        color: UIHelper
                                                            .colorGreySuperLight),
                                                textAlign: TextAlign.center,
                                              ))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  UIHelper.setResHeight(10)),
                                          height: UIHelper.setResHeight(140),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                      .data[0].imageUrl),
                                                  fit: BoxFit.fill)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                UIHelper.setResWidth(10),
                                          ),
                                          child: SizedBox(
                                              child: Text(
                                            snapshot.data[0].deskripsi,
                                            style: UIHelper.greyLightFont,
                                          )),
                                        ),
                                        UIHelper.vertSpace(10),
                                        Row(
                                          children: [
                                            Spacer(),
                                            Expanded(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height:
                                                      UIHelper.setResHeight(13),
                                                  width:
                                                      UIHelper.setResWidth(13),
                                                  child: Image(
                                                      image: AssetImage(
                                                          "assets/comment_red.png")),
                                                ),
                                                UIHelper.horzSpace(5),
                                                Text(
                                                  snapshot.data[0]
                                                              .listIdComment !=
                                                          null
                                                      ? snapshot.data[0]
                                                          .listIdComment.length
                                                          .toString()
                                                      : "0",
                                                  style: UIHelper.redFont
                                                      .copyWith(
                                                          fontSize: UIHelper
                                                              .setResFontSize(
                                                                  10),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                )
                                              ],
                                            )),
                                            Expanded(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height:
                                                      UIHelper.setResHeight(13),
                                                  width:
                                                      UIHelper.setResWidth(13),
                                                  child: Image(
                                                      image: AssetImage(
                                                          "assets/like_red.png")),
                                                ),
                                                UIHelper.horzSpace(5),
                                                Text(
                                                  snapshot.data[0].jumlahLike
                                                      .toString(),
                                                  style: UIHelper.redFont
                                                      .copyWith(
                                                          fontSize: UIHelper
                                                              .setResFontSize(
                                                                  10),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                )
                                              ],
                                            )),
                                            Spacer()
                                          ],
                                        ),
                                        UIHelper.vertSpace(10),
                                      ],
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      UIHelper.vertSpace(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          generateActionContainer(
                              "assets/comment",
                              "Comment",
                              false,
                              true,
                              widget.idArtikel,
                              widget.pengguna,
                              widget.judul,
                              ""),
                          generateActionContainer(
                              "assets/like",
                              "Like",
                              true,
                              true,
                              widget.idArtikel,
                              widget.pengguna,
                              widget.judul,
                              ""),
                          generateActionContainer(
                              "assets/like",
                              "Save",
                              true,
                              true,
                              widget.idArtikel,
                              widget.pengguna,
                              widget.judul,
                              ""),
                        ],
                      ),
                      UIHelper.vertSpace(20),
                      commentSection(widget.idArtikel, widget.pengguna.email),
                      UIHelper.vertSpace(20),
                    ],
                  )
                ],
              ),
              TopBar("Info", () {
                pageBloc.add(GoToInfoPage());
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget generateActionContainer(
      String asset,
      String title,
      bool active,
      bool isCommentArticle,
      String idArtikel,
      Pengguna pengguna,
      String judul,
      String repliedUser) {
    String inputtedAsset = (active) ? asset + "_red.png" : asset + ".png";
    String inputtedTitle = (active) ? title + "d" : title;
    Color backgroundColor = (active) ? UIHelper.colorPink : Colors.white;
    Color borderColor =
        (active) ? UIHelper.colorMainLightRed : UIHelper.colorMediumLightGrey;
    return GestureDetector(
      onTap: () {
        if (isCommentArticle) {
          pageBloc.add(GoToAddCommentPage(
              judul, idArtikel, pengguna, false, repliedUser));
        } else {
          pageBloc.add(GoToAddCommentPage(
              judul, idArtikel, pengguna, true, repliedUser));
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: UIHelper.setResWidth(10),
            vertical: UIHelper.setResHeight(5)),
        margin: EdgeInsets.symmetric(horizontal: UIHelper.setResWidth(3)),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: UIHelper.setResHeight(13),
                width: UIHelper.setResWidth(13),
                child: Image(
                  image: AssetImage(inputtedAsset),
                )),
            UIHelper.horzSpace(5),
            Text(
              inputtedTitle,
              style: (!active)
                  ? UIHelper.greyLightFont.copyWith(
                      color: UIHelper.colorGreySuperLight,
                      fontSize: UIHelper.setResFontSize(10),
                      fontWeight: FontWeight.w400)
                  : UIHelper.redFont.copyWith(
                      fontSize: UIHelper.setResFontSize(10),
                      fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }

  Widget commentSection(String idArtikel, String email) {
    return FutureBuilder(
      future: Future.wait(
          [KomentarServices.getAllKomentarWithReplies(idArtikel, email)]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          List<Widget> children = [];
          for (var komentar in snapshot.data[0]) {
            children.add(generateCommentContainer(komentar.namaLengkap,
                komentar.isi, komentar.jumlahLike, komentar.tanggalPost, true));
            children.add(UIHelper.vertSpace(5));
            if (komentar.replies != null) {
              for (Reply reply in komentar.replies) {
                children.add(generateRepliedCommentContainer(
                    reply.namaLengkap, reply.isi, 0, reply.tanggalPost));
                children.add(UIHelper.vertSpace(5));
              }
            }
          }
          return Container(
              padding:
                  EdgeInsets.symmetric(horizontal: UIHelper.setResWidth(17)),
              child: Column(children: children));
        } else {
          return Container();
        }
      },
    );
  }

  Widget generateRepliedCommentContainer(
      String name, String comment, int likeAmount, String date) {
    return generateCommentContainer(name, comment, likeAmount, date, false,
        width: 290);
  }

  Widget generateCommentContainer(
      String name, String comment, int likeAmount, String date, bool isParent,
      {double width = 320}) {
    String dateString = getTanggalForUI(date);
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          padding: EdgeInsets.all(10),
          width: UIHelper.setResWidth(width),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: UIHelper.colorMediumLightGrey)),
          child: Column(
            children: [
              SizedBox(
                width: UIHelper.setResWidth(width - 20),
                child: Text(name,
                    style: UIHelper.darkGreyFont.copyWith(
                        fontSize: UIHelper.setResFontSize(10),
                        fontWeight: FontWeight.w700)),
              ),
              UIHelper.vertSpace(5),
              SizedBox(
                width: UIHelper.setResWidth(width - 20),
                child: Text(comment,
                    style: UIHelper.greyLightFont.copyWith(
                        fontSize: UIHelper.setResFontSize(10),
                        fontWeight: FontWeight.w400)),
              ),
              UIHelper.vertSpace(7),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedBox(
                  child: Row(
                    children: [
                      (isParent)
                          ? generateActionContainer(
                              "assets/comment",
                              "Reply",
                              false,
                              false,
                              widget.idArtikel,
                              widget.pengguna,
                              widget.judul,
                              name)
                          : Container(),
                      (isParent)
                          ? generateActionContainer(
                              "assets/like",
                              likeAmount.toString(),
                              false,
                              false,
                              widget.idArtikel,
                              widget.pengguna,
                              widget.judul,
                              name)
                          : Container()
                    ],
                  ),
                ),
                SizedBox(
                  child: Text(dateString,
                      style: UIHelper.greyLightFont.copyWith(
                          color: UIHelper.colorGreySuperLight,
                          fontSize: UIHelper.setResFontSize(10),
                          fontWeight: FontWeight.w400)),
                )
              ])
            ],
          )),
    );
  }
}
