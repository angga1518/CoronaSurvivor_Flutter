part of 'widgets.dart';

class LogoCardContainer extends StatelessWidget {
  final String title;
  final String nextMessage;
  final String assetName;
  final String message;
  final String buttonMessage;
  final double buttonHeight;
  final double buttonWidth;
  final Function onMessageTap;
  LogoCardContainer(this.title, this.assetName, this.message,
      this.buttonMessage, this.buttonHeight, this.buttonWidth,
      {this.nextMessage, this.onMessageTap});
  @override
  Widget build(BuildContext context) {
    return CardContainer(
        title,
        Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: UIHelper.setResWidth(52),
                  height: UIHelper.setResHeight(51),
                  child: Image(image: AssetImage(assetName)),
                ),
                UIHelper.horzSpace(10),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: UIHelper.colorSoftPink, width: 2)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(18, 12, 18, 10),
                    child: Column(
                      children: [
                        SizedBox(
                          width: UIHelper.setResWidth(190),
                          child: Text(
                            message,
                            style: UIHelper.greyLightFont.copyWith(
                                fontSize: UIHelper.setResFontSize(12)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        UIHelper.vertSpace(10),
                        PinkButton(
                          buttonMessage,
                          () {
                            onMessageTap();
                          },
                          fontSize: UIHelper.setResFontSize(10),
                          height: UIHelper.setResHeight(buttonHeight),
                          width: UIHelper.setResWidth(buttonWidth),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            UIHelper.vertSpace(10),
            (nextMessage == null)
                ? SizedBox()
                : BlueNavigation(nextMessage, onMessageTap)
          ],
        ));
  }
}
