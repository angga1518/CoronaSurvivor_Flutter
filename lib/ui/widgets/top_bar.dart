part of 'widgets.dart';

class TopBar extends StatelessWidget {
  Function onTap;
  String pageName;
  TopBar(this.pageName, this.onTap);
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
              children: [
                UIHelper.horzSpace(23),
                GestureDetector(
                  onTap: () {
                    onTap();
                  },
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
