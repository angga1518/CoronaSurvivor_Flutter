part of 'widgets.dart';

class TopBar extends StatelessWidget {
  String pageName;
  TopBar(this.pageName);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: UIHelper.responsive.setHeight(68),
      color: Colors.white,
      child: Stack(
        children: [
          Row(
            children: [
              UIHelper.horzSpace(23),
              Container(
                height: UIHelper.responsive.setHeight(32),
                width: UIHelper.responsive.setWidth(32),
                decoration: BoxDecoration(
                    color: UIHelper.colorSoftPink,
                    borderRadius: BorderRadius.circular(8),
                    image:
                        DecorationImage(image: AssetImage("assets/back.png"))),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pageName,
                style: UIHelper.redFont
                    .copyWith(fontSize: UIHelper.responsive.setSp(18)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
