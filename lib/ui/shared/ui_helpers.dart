part of 'shared_ui.dart';

class UIHelper {
  double defaultScreenWidth = 360.0;
  double defaultScreenHeight = 640.0;

  UIHelper(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);
  }
  static ScreenUtil get responsive => ScreenUtil.instance;
  static double get height => ScreenUtil.screenHeightDp;
  static double get width => ScreenUtil.screenWidthDp;

  static SizedBox vertSpace(double space) =>
      SizedBox(height: responsive.setHeight(space));
  static SizedBox horzSpace(double space) =>
      SizedBox(width: responsive.setWidth(space));

  static TextStyle redFont = GoogleFonts.dmSans()
      .copyWith(color: colorMainRed, fontSize: responsive.setSp(20));
  static TextStyle darkGreyFont = GoogleFonts.dmSans().copyWith(
      color: colorDarkGrey,
      fontSize: responsive.setSp(15),
      fontWeight: FontWeight.w700);
  static TextStyle greyLightFont = GoogleFonts.dmSans().copyWith(
      color: colorGreyLight,
      fontSize: responsive.setSp(13),
      fontWeight: FontWeight.w400);
  static TextStyle greyFont = GoogleFonts.dmSans().copyWith(
      color: colorGrey,
      fontSize: responsive.setSp(13),
      fontWeight: FontWeight.w400);
  static TextStyle whiteFont = GoogleFonts.dmSans()
      .copyWith(color: Colors.white, fontSize: responsive.setSp(17));
  static TextStyle blueFont = GoogleFonts.dmSans()
      .copyWith(color: colorSoftBlue, fontSize: responsive.setSp(17));
  static TextStyle greenFont = GoogleFonts.dmSans()
      .copyWith(color: colorMainGreen, fontSize: responsive.setSp(17));
  static TextStyle yellowFont = GoogleFonts.dmSans()
      .copyWith(color: colorMainYellow, fontSize: responsive.setSp(17));

  static Color kColorButtonPink = Color(0xFFFFE0E0);
  static Color kColorButtonText = Color(0xFFFC312F);
  static Color kColorButtonBorder = Color(0xFFFFCFCF);

  static Color colorMainRed = Color(0xFFFC312F);
  static Color colorMainLightRed = Color(0xFFFFCFCF);
  static Color colorMainGreen = Color(0xFF45AB5D);
  static Color colorMainYellow = Color(0xFFFB8D46);
  static Color colorPink = Color(0xFFFFE0E0);
  static Color colorPinkLight = Color(0xFFEECACA);
  static Color colorPinkSuperLight = Color(0xFFF6F1F1);
  static Color colorSoftPink = Color(0xFFF9F3F3);
  static Color colorDarkGrey = Color(0xFF1B252E);
  static Color colorSoftBlue = Color(0xFF4193C0);
  static Color colorGrey = Color(0xFF40576B);
  static Color colorGreyLight = Color(0xFF52708A);
  static Color colorGreySuperLight = Color(0xFF8DA2B6);
  static Color colorDarkWhite = Color(0xFFF2F4F5);

  static Widget fourBubble(int index) {
    List<Widget> listBubble = [];
    for (var i = 0; i < 4; i++) {
      if (i != 0) {
        listBubble.add(UIHelper.horzSpace(13));
      }
      if (i + 1 == index) {
        listBubble.add(Container(
          height: UIHelper.responsive.setHeight(7),
          width: UIHelper.responsive.setWidth(7),
          decoration: BoxDecoration(
              color: UIHelper.colorMainRed, shape: BoxShape.circle),
        ));
        continue;
      }
      listBubble.add(Container(
        height: UIHelper.responsive.setHeight(7),
        width: UIHelper.responsive.setWidth(7),
        decoration: BoxDecoration(
            color: UIHelper.colorGreySuperLight, shape: BoxShape.circle),
      ));
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center, children: listBubble);
  }
}
