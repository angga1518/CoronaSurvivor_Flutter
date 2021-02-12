part of 'widgets.dart';

class PinkButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final double fontSize;
  final double height;
  final double width;
  PinkButton(this.text, this.onTap,
      {this.fontSize = 17, this.height = 50, this.width = 252});

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
                      fontSize: UIHelper.setResFontSize(fontSize),
                      color: UIHelper.colorMainRed),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        height: UIHelper.setResHeight(height),
        width: UIHelper.setResWidth(width),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.white.withOpacity(0.05)),
          ],
          border: Border.all(color: UIHelper.colorMainLightRed),
          borderRadius: BorderRadius.circular(10),
        ));
  }
}
