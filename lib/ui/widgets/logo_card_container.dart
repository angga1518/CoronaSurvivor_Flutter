part of 'widgets.dart';

class LogoCardContainer extends StatelessWidget {
  final String title;
  final String nextMessage;
  final String assetName;
  final String message;
  final String buttonMessage;
  final double buttonHeight;
  final double buttonWidth;
  LogoCardContainer(this.title, this.assetName, this.message,
      this.buttonMessage, this.buttonHeight, this.buttonWidth,
      {this.nextMessage});
  @override
  Widget build(BuildContext context) {
    return CardContainer(
        title,
        Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: UIHelper.responsive.setWidth(52),
                  height: UIHelper.responsive.setHeight(51),
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
                          width: UIHelper.responsive.setWidth(190),
                          child: Text(
                            message,
                            style: UIHelper.greyLightFont.copyWith(
                                fontSize: UIHelper.responsive.setSp(12)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        UIHelper.vertSpace(10),
                        PinkButton(
                          buttonMessage,
                          () {},
                          fontSize: UIHelper.responsive.setSp(10),
                          height: UIHelper.responsive.setHeight(buttonHeight),
                          width: UIHelper.responsive.setWidth(buttonWidth),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            UIHelper.vertSpace(10),
            (nextMessage == null) ? SizedBox() : BlueNavigation(nextMessage)
          ],
        ));
  }
}
