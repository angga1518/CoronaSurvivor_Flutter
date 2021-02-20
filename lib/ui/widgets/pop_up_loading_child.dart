part of 'widgets.dart';

class PopUpLoadingChild extends StatelessWidget {
  PopUpLoadingChild();

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
            height: UIHelper.setResHeight(165),
            padding: EdgeInsets.symmetric(
                vertical: UIHelper.setResHeight(10),
                horizontal: UIHelper.setResWidth(10)),
            child: Column(
              children: [
                UIHelper.vertSpace(30),
                Center(
                  child: SpinKitRing(
                    color: UIHelper.colorMainLightRed,
                  ),
                ),
                UIHelper.vertSpace(20),
                Text(
                  "Mohon tunggu sebentar..",
                  style: UIHelper.greyFont.copyWith(
                      fontSize: UIHelper.setResFontSize(16),
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                // Text(
                //   desc,
                //   style: UIHelper.greyLightFont
                //       .copyWith(fontSize: UIHelper.setResFontSize(12)),
                //   textAlign: TextAlign.center,
                // ),
                UIHelper.vertSpace(20),
              ],
            )));
  }
}
