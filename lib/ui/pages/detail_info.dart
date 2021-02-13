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
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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
}
