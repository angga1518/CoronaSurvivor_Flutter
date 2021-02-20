part of 'widgets.dart';

class PopUpChild extends StatelessWidget {
  final String title;
  final String desc;
  final Widget child;
  final bool custom;
  final double height;
  final Function positiveAction;
  final Function negativetiveAction;

  PopUpChild(
      this.title, this.desc, this.negativetiveAction, this.positiveAction,
      {this.child, this.custom = false, this.height = 240});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: UIHelper.colorGreyLight)),
            width: UIHelper.setResWidth(290),
            height: UIHelper.setResHeight(height),
            padding: EdgeInsets.symmetric(
                vertical: UIHelper.setResHeight(10),
                horizontal: UIHelper.setResWidth(10)),
            child: Column(
              children: [
                UIHelper.vertSpace(30),
                Text(
                  title,
                  style: UIHelper.darkGreyFont.copyWith(
                      fontSize: UIHelper.setResFontSize(16),
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                UIHelper.vertSpace(20),
                Text(
                  desc,
                  style: UIHelper.greyLightFont
                      .copyWith(fontSize: UIHelper.setResFontSize(12)),
                  textAlign: TextAlign.center,
                ),
                UIHelper.vertSpace(20),
                (custom)
                    ? child
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Material(
                              color: Colors.white,
                              child: InkWell(
                                splashColor: UIHelper.colorSoftPink,
                                onTap: () {
                                  negativetiveAction();
                                },
                                child: Container(
                                  width: UIHelper.setResWidth(58),
                                  height: UIHelper.setResHeight(36),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: UIHelper.colorGreySuperLight,
                                          width: 2)),
                                  child: Center(
                                    child: Text("Tidak",
                                        style: UIHelper.greyLightFont.copyWith(
                                            color: UIHelper.colorGreySuperLight,
                                            fontSize:
                                                UIHelper.setResFontSize(12))),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          UIHelper.horzSpace(8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Material(
                              color: Colors.white,
                              child: InkWell(
                                splashColor: UIHelper.colorSoftPink,
                                onTap: () {
                                  positiveAction();
                                },
                                child: Container(
                                  width: UIHelper.setResWidth(58),
                                  height: UIHelper.setResHeight(36),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: UIHelper.colorGreySuperLight,
                                          width: 2)),
                                  child: Center(
                                    child: Text("Ya",
                                        style: UIHelper.greyLightFont.copyWith(
                                            color: UIHelper.colorGreySuperLight,
                                            fontSize:
                                                UIHelper.setResFontSize(12))),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
              ],
            )));
  }
}
