part of 'pages.dart';

class DetailInfo extends StatefulWidget {
  @override
  _DetailInfoState createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
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
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: UIHelper.setResWidth(200),
                                    child: Text(
                                      "Tata Cara Mencuci Hidung yang Benar",
                                      style: UIHelper.darkGreyFont.copyWith(
                                          fontSize:
                                              UIHelper.setResFontSize(16)),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  UIHelper.vertSpace(20),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: UIHelper.setResWidth(15)),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          "Nama Organisasi",
                                          style: UIHelper.greyLightFont
                                              .copyWith(
                                                  fontSize:
                                                      UIHelper.setResFontSize(
                                                          10),
                                                  color: UIHelper
                                                      .colorGreySuperLight),
                                          textAlign: TextAlign.center,
                                        )),
                                        Expanded(
                                            child: Text(
                                          "Nama Pengarang",
                                          style: UIHelper.greyLightFont
                                              .copyWith(
                                                  fontSize:
                                                      UIHelper.setResFontSize(
                                                          10),
                                                  color: UIHelper
                                                      .colorGreySuperLight),
                                          textAlign: TextAlign.center,
                                        )),
                                        Expanded(
                                            child: Text(
                                          "Tanggal Publish",
                                          style: UIHelper.greyLightFont
                                              .copyWith(
                                                  fontSize:
                                                      UIHelper.setResFontSize(
                                                          10),
                                                  color: UIHelper
                                                      .colorGreySuperLight),
                                          textAlign: TextAlign.center,
                                        ))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: UIHelper.setResHeight(10)),
                                    height: UIHelper.setResHeight(140),
                                    decoration:
                                        BoxDecoration(color: Colors.blue),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: UIHelper.setResWidth(10),
                                    ),
                                    child: SizedBox(
                                        child: Text(
                                      "Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vita\n\nQuis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio di",
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
                                            height: UIHelper.setResHeight(13),
                                            width: UIHelper.setResWidth(13),
                                            child: Image(
                                                image: AssetImage(
                                                    "assets/comment_red.png")),
                                          ),
                                          UIHelper.horzSpace(5),
                                          Text(
                                            "667",
                                            style: UIHelper.redFont.copyWith(
                                                fontSize:
                                                    UIHelper.setResFontSize(10),
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      )),
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: UIHelper.setResHeight(13),
                                            width: UIHelper.setResWidth(13),
                                            child: Image(
                                                image: AssetImage(
                                                    "assets/like_red.png")),
                                          ),
                                          UIHelper.horzSpace(5),
                                          Text(
                                            "200",
                                            style: UIHelper.redFont.copyWith(
                                                fontSize:
                                                    UIHelper.setResFontSize(10),
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      )),
                                      Spacer()
                                    ],
                                  ),
                                  UIHelper.vertSpace(10),
                                ],
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
                              "assets/comment", "Comment", false),
                          generateActionContainer("assets/like", "Like", true),
                          generateActionContainer("assets/like", "Save", true),
                        ],
                      ),
                      UIHelper.vertSpace(20),
                      commentSection(),
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

  Widget generateActionContainer(String asset, String title, bool active) {
    String inputtedAsset = (active) ? asset + "_red.png" : asset + ".png";
    String inputtedTitle = (active) ? title + "d" : title;
    Color backgroundColor = (active) ? UIHelper.colorPink : Colors.white;
    Color borderColor =
        (active) ? UIHelper.colorMainLightRed : UIHelper.colorMediumLightGrey;
    return Container(
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
    );
  }

  Widget commentSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: UIHelper.setResWidth(17)),
      child: Column(
        children: [
          generateCommentContainer(
              "Muhammad Erlangga",
              "ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
              200,
              DateTime.now(),
              true),
          UIHelper.vertSpace(5),
          generateRepliedCommentContainer(
              "Muhammad Erlangga",
              "ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
              200,
              DateTime.now()),
          UIHelper.vertSpace(5),
          generateRepliedCommentContainer(
              "Muhammad Erlangga",
              "ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
              200,
              DateTime.now()),
          UIHelper.vertSpace(5),
          generateCommentContainer(
              "Muhammad Erlangga",
              "ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
              200,
              DateTime.now(),
              true),
          UIHelper.vertSpace(5),
          generateRepliedCommentContainer(
              "Muhammad Erlangga",
              "ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
              200,
              DateTime.now()),
          UIHelper.vertSpace(5),
          generateRepliedCommentContainer(
              "Muhammad Erlangga",
              "ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
              200,
              DateTime.now()),
        ],
      ),
    );
  }

  Widget generateRepliedCommentContainer(
      String name, String comment, int likeAmount, DateTime date) {
    return generateCommentContainer(name, comment, likeAmount, date, false,
        width: 290);
  }

  Widget generateCommentContainer(
      String name, String comment, int likeAmount, DateTime date, bool isParent,
      {double width = 320}) {
    String dateString = DateFormat('dd/MM/yyyy kk:mm').format(date);
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
                              "assets/comment", "Reply", false)
                          : Container(),
                      generateActionContainer(
                          "assets/like", likeAmount.toString(), false),
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
