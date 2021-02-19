part of 'widgets.dart';

class PinkButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final double fontSize;
  final double height;
  final double width;
  final bool isEnabled;
  PinkButton(this.text, this.onTap,
      {this.fontSize = 17,
      this.height = 50,
      this.width = 252,
      this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: (isEnabled)
                ? UIHelper.colorPink
                : UIHelper.colorGreySuperLight2,
            child: InkWell(
              splashColor: (isEnabled) ? UIHelper.colorPinkLight : null,
              onTap: (isEnabled)
                  ? () {
                      onTap();
                    }
                  : null,
              child: Center(
                child: Text(
                  text,
                  style: UIHelper.redFont.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: UIHelper.setResFontSize(fontSize),
                      color: (isEnabled)
                          ? UIHelper.colorMainRed
                          : UIHelper.colorGreySuperLight),
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
          border: Border.all(
              color: (isEnabled)
                  ? UIHelper.colorMainLightRed
                  : UIHelper.colorGreySuperLight),
          borderRadius: BorderRadius.circular(10),
        ));
  }
}
