part of 'widgets.dart';

class PinkButton extends StatelessWidget {
  final String text;
  final Function onTap;
  PinkButton(this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: UIHelper.colorPink,
            child: InkWell(
              splashColor: UIHelper.colorPinkLight,
              onTap: () {
                onTap();
              },
              child: Center(
                child: Text(
                  text,
                  style: UIHelper.redFont.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: UIHelper.responsive.setSp(17),
                      color: UIHelper.colorMainRed),
                ),
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
          border: Border.all(color: UIHelper.colorMainLightRed),
          borderRadius: BorderRadius.circular(10),
        ));
  }
}
