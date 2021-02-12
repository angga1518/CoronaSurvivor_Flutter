part of 'widgets.dart';

class BlueNavigation extends StatelessWidget {
  final String message;
  BlueNavigation(this.message);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
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
    );
  }
}
