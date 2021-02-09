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
  static TextStyle greyFont = GoogleFonts.dmSans().copyWith(
      color: colorGreyLight,
      fontSize: responsive.setSp(13),
      fontWeight: FontWeight.w400);
  static TextStyle whiteFont = GoogleFonts.dmSans()
      .copyWith(color: Colors.white, fontSize: responsive.setSp(17));

  static Color kColorButtonPink = Color(0xFFFFE0E0);
  static Color kColorButtonText = Color(0xFFFC312F);
  static Color kColorButtonBorder = Color(0xFFFFCFCF);

  static Color colorMainRed = Color(0xFFFC312F);
  static Color colorMainLightRed = Color(0xFFFFCFCF);
  static Color colorPink = Color(0xFFFFE0E0);
  static Color colorPinkLight = Color(0xFFEECACA);
  static Color colorGreyLight = Color(0xFF52708A);
}
