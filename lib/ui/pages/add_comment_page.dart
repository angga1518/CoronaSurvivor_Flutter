part of 'pages.dart';

class AddCommentPage extends StatefulWidget {
  final String title;
  final Pengguna pengguna;
  final bool isReply;
  final String idArtkel;
  final String namaReplied;

  AddCommentPage(
      this.title, this.idArtkel, this.pengguna, this.isReply, this.namaReplied);

  @override
  _AddCommentPageState createState() => _AddCommentPageState();
}

class _AddCommentPageState extends State<AddCommentPage> {
  TextEditingController textController;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return WillPopScope(
      onWillPop: () async {
        pageBloc.add(
            GoToDetailInfoPage(widget.idArtkel, widget.pengguna, widget.title));
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
                          padding: EdgeInsets.all(10),
                          width: UIHelper.setResWidth(322),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              SizedBox(
                                width: UIHelper.setResWidth(250),
                                child: Text(
                                  widget.isReply
                                      ? "Reply to " + widget.namaReplied
                                      : widget.title,
                                  textAlign: TextAlign.center,
                                  style: UIHelper.darkGreyFont.copyWith(
                                      fontSize: UIHelper.setResFontSize(13),
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              UIHelper.vertSpace(3),
                              (widget.isReply)
                                  ? SizedBox(
                                      width: UIHelper.setResWidth(250),
                                      child: Text(
                                        widget.title,
                                        textAlign: TextAlign.center,
                                        style: UIHelper.darkGreyFont.copyWith(
                                            fontSize:
                                                UIHelper.setResFontSize(10),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  : Container(),
                              UIHelper.vertSpace(15),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  width: UIHelper.setResWidth(250),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color:
                                              UIHelper.colorMediumLightGrey)),
                                  child: TextField(
                                    maxLines: 5,
                                    style: UIHelper.greyLightFont.copyWith(
                                        color: UIHelper.colorGreySuperLight,
                                        fontSize: UIHelper.setResFontSize(13)),
                                    controller: textController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: (widget.isReply)
                                            ? "Tuliskan balasan Anda ..."
                                            : "Tuliskan komen Anda ...",
                                        hintStyle: UIHelper.greyLightFont
                                            .copyWith(
                                                color: UIHelper
                                                    .colorGreySuperLight,
                                                fontSize:
                                                    UIHelper.setResFontSize(
                                                        13))),
                                  )),
                              UIHelper.vertSpace(10),
                            ],
                          )),
                      UIHelper.vertSpace(20),
                    ],
                  )
                ],
              ),
              TopBar((widget.isReply) ? "Reply" : "Comment", () {
                pageBloc.add(GoToDetailInfoPage(
                    widget.idArtkel, widget.pengguna, widget.title));
              }),
              Positioned(
                  top: UIHelper.setResHeight(520),
                  left: UIHelper.setResWidth((360 - 252) / 2),
                  child: PinkButton("Kirim", () async {
                    if (widget.isReply) {
                      Reply reply = new Reply();
                    } else {
                      Komentar komentar = new Komentar(
                          namaLengkap: widget.pengguna.namaLengkap,
                          isi: textController.text,
                          tanggalPost: DateTime.now().toString(),
                          jumlahLike: 0);
                      await KomentarServices.saveKomentar(
                          komentar, widget.idArtkel);
                    }
                    // pageBloc.add(GoToDetailInfoPage());
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
