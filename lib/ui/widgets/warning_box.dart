part of 'widgets.dart';

class WarningBox extends StatelessWidget {
  final double width;
  final String information;

  WarningBox(this.width, this.information);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UIHelper.setResWidth(width),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: UIHelper.colorMainYellow.withOpacity(0.15)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            UIHelper.setResWidth(10),
            UIHelper.setResHeight(8),
            UIHelper.setResWidth(10),
            UIHelper.setResHeight(8)),
        child: Row(
          children: [
            SizedBox(
                height: UIHelper.setResHeight(15),
                width: UIHelper.setResWidth(15),
                child: Image(
                  image: AssetImage("assets/info.png"),
                  width: 10,
                  height: 10,
                )),
            UIHelper.horzSpace(5),
            SizedBox(
              width: UIHelper.setResWidth(width - 40),
              child: Text(
                information,
                style: UIHelper.yellowFont
                    .copyWith(fontSize: UIHelper.setResFontSize(10)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
