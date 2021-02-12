part of 'widgets.dart';

class Logo extends StatelessWidget {
  double logoSize;
  double fontLawan;
  double fontCovid;
  double containerWidth;
  Logo(this.logoSize, this.fontLawan, this.fontCovid, this.containerWidth);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UIHelper.setResWidth(containerWidth),
        child: Row(
      children: [
        Container(
          height: UIHelper.setResHeight(logoSize),
          width: UIHelper.setResWidth(logoSize),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/logo.png"), fit: BoxFit.contain)),
        ),
        RichText(
          text: TextSpan(
            text: 'Lawan',
            style: UIHelper.redFont.copyWith(
                fontSize: UIHelper.setResFontSize(fontLawan),
                fontWeight: FontWeight.w400),
            children: <TextSpan>[
              TextSpan(
                  text: 'Covid',
                  style: UIHelper.redFont.copyWith(
                      fontSize: UIHelper.setResFontSize(fontCovid),
                      fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ],
    )
        //
        );
  }
}
