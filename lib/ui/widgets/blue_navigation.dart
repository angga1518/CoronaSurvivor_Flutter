part of 'widgets.dart';

class BlueNavigation extends StatelessWidget {
  final String message;
  final Function onTap;
  final MainAxisAlignment mainAxisAlignment;
  BlueNavigation(this.message, this.onTap, {this.mainAxisAlignment = MainAxisAlignment.end});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Text(
            message,
            style: UIHelper.blueFont.copyWith(
                fontSize: UIHelper.setResFontSize(12),
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline),
          ),
          UIHelper.horzSpace(5),
          Container(
            height: UIHelper.setResHeight(15),
            width: UIHelper.setResWidth(15),
            decoration: BoxDecoration(
                color: UIHelper.colorPinkSuperLight, shape: BoxShape.circle),
            child: Center(
              child: SizedBox(
                child: Image(
                  image: AssetImage("assets/forward.png"),
                  height: UIHelper.setResHeight(10),
                  width: UIHelper.setResWidth(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
