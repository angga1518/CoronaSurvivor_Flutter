part of 'widgets.dart';

class TopBar extends StatelessWidget {
  Function onTap;
  String pageName;
  bool helpButton;
  Function onTapHelp;
  TopBar(this.pageName, this.onTap, {this.helpButton = false, this.onTapHelp});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: UIHelper.setResHeight(68),
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: UIHelper.setResHeight(18)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    onTap();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: UIHelper.setResWidth(23)),
                    child: Stack(
                      children: [
                        Container(
                          height: UIHelper.setResHeight(32),
                          width: UIHelper.setResWidth(32),
                          decoration: BoxDecoration(
                            color: UIHelper.colorSoftPink,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Container(
                          height: UIHelper.setResHeight(32),
                          width: UIHelper.setResWidth(32),
                          child: Center(
                            child: SizedBox(
                              child: Image(
                                image: AssetImage("assets/back.png"),
                                height: UIHelper.setResHeight(15),
                                width: UIHelper.setResWidth(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                (helpButton)
                    ? GestureDetector(
                        onTap: () {
                          onTapHelp();
                        },
                        child: Container(
                          margin:
                              EdgeInsets.only(right: UIHelper.setResWidth(23)),
                          child: Stack(
                            children: [
                              Container(
                                height: UIHelper.setResHeight(32),
                                width: UIHelper.setResWidth(32),
                                decoration: BoxDecoration(
                                  color: UIHelper.colorSoftPink,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              Container(
                                height: UIHelper.setResHeight(32),
                                width: UIHelper.setResWidth(32),
                                child: Center(
                                  child: SizedBox(
                                    child: Image(
                                      image: AssetImage(
                                          "assets/question_mark.png"),
                                      height: UIHelper.setResHeight(15),
                                      width: UIHelper.setResWidth(15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        width: UIHelper.setResWidth(32),
                        height: UIHelper.setResHeight(32),
                        margin:
                            EdgeInsets.only(right: UIHelper.setResWidth(23)),
                      ),
              ],
            ),
          ),
          Center(
            child: Text(
              pageName,
              style: UIHelper.redFont
                  .copyWith(fontSize: UIHelper.setResFontSize(18)),
            ),
          )
        ],
      ),
    );
    // return Container(
    //   height: UIHelper.setResHeight(68),
    //   color: Colors.white,
    //   child: Stack(
    //     children: [
    //       Row(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           UIHelper.horzSpace(23),
    //           Container(
    //             height: UIHelper.setResHeight(32),
    //             width: UIHelper.setResWidth(32),
    //             decoration: BoxDecoration(
    //                 color: UIHelper.colorSoftPink,
    //                 borderRadius: BorderRadius.circular(8),
    //                 image:
    //                     DecorationImage(image: AssetImage("assets/back.png"))),
    //           ),
    //         ],
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text(
    //             pageName,
    //             style: UIHelper.redFont
    //                 .copyWith(fontSize: UIHelper.setResFontSize(18)),
    //           )
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
