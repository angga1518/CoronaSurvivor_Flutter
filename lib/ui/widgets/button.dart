part of 'widgets.dart';

class PinkButton extends StatelessWidget {
  final String text;
  final Function onTap;
  PinkButton(this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Material(
          color: UIHelper.kColorButtonPink,
          child: InkWell(
            splashColor: Color(0xFFEECACA),
            onTap: () {},
            child: Center(
              child: Text(
                text,
                style: UIHelper.testFont.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: UIHelper.responsive.setSp(17),
                    color: UIHelper.kColorButtonText),
              ),
            ),
          ),
        ),
        height: UIHelper.responsive.setHeight(50),
        width: UIHelper.responsive.setWidth(252),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.white.withOpacity(0.05)),
          ],
          border: Border.all(color: UIHelper.kColorButtonBorder),
          borderRadius: BorderRadius.circular(10),
        ));
  }
}
