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

  // to use this use UIHelper.testfont.copyWith(your desired custom)
  static TextStyle testFont = GoogleFonts.dmSans().copyWith(color: Colors.black, fontSize: responsive.setSp(20)); 
}


