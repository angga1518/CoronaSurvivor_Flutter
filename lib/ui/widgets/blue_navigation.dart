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
              fontSize: UIHelper.responsive.setSp(12),
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline),
        ),
        UIHelper.horzSpace(5),
        Container(
          height: UIHelper.responsive.setHeight(15),
          width: UIHelper.responsive.setWidth(15),
          decoration: BoxDecoration(
              color: UIHelper.colorPinkSuperLight, shape: BoxShape.circle),
          child: Center(
            child: SizedBox(
              child: Image(
                image: AssetImage("assets/forward.png"),
                height: UIHelper.responsive.setHeight(10),
                width: UIHelper.responsive.setWidth(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
