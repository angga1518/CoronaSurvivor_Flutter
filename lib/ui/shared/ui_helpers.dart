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

  // to use this use UIHelper.testfont.copyWith(your desired custom)
  static TextStyle testFont = GoogleFonts.dmSans()
      .copyWith(color: Colors.black, fontSize: responsive.setSp(20));

  static Color color1 = Color(0xFFE4E4E4);
}
