part of 'widgets.dart';

class WarningBox extends StatelessWidget {
  final double width;
  final String information;

  WarningBox(this.width, this.information);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UIHelper.setResWidth(width),
      height: 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: UIHelper.colorMainYellow),
      child: Padding(
        padding: EdgeInsets.only(left: UIHelper.setResWidth(10)),
        child: Row(
          children: [
            SizedBox(
              height: UIHelper.setResHeight(15),
              width: UIHelper.setResWidth(15),
              child: Image(image: AssetImage("assets/info.png")),
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
