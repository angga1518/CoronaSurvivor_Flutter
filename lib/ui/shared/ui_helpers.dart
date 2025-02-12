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
  static double setResWidth(double width) {
    return ScreenUtil.instance.setWidth(width);
  }

  static double setResHeight(double height) {
    return ScreenUtil.instance.setHeight(height);
  }

  static double setResFontSize(double fontSize) {
    return ScreenUtil.instance.setSp(fontSize);
  }

  static double get height => ScreenUtil.screenHeightDp;
  static double get width => ScreenUtil.screenWidthDp;

  static SizedBox vertSpace(double space) =>
      SizedBox(height: setResHeight(space));
  static SizedBox horzSpace(double space) =>
      SizedBox(width: setResWidth(space));

  static TextStyle redFont = GoogleFonts.dmSans()
      .copyWith(color: colorMainRed, fontSize: setResFontSize(20));
  static TextStyle darkGreyFont = GoogleFonts.dmSans().copyWith(
      color: colorDarkGrey,
      fontSize: setResFontSize(15),
      fontWeight: FontWeight.w700);
  static TextStyle greyLightFont = GoogleFonts.dmSans().copyWith(
      color: colorGreyLight,
      fontSize: setResFontSize(13),
      fontWeight: FontWeight.w400);
  static TextStyle greyFont = GoogleFonts.dmSans().copyWith(
      color: colorGrey,
      fontSize: setResFontSize(13),
      fontWeight: FontWeight.w400);
  static TextStyle whiteFont = GoogleFonts.dmSans().copyWith(
      color: Colors.white,
      fontSize: setResFontSize(17),
      fontWeight: FontWeight.w400);
  static TextStyle blueFont = GoogleFonts.dmSans().copyWith(
      color: colorSoftBlue,
      fontSize: setResFontSize(17),
      fontWeight: FontWeight.w400);
  static TextStyle greenFont = GoogleFonts.dmSans().copyWith(
      color: colorMainGreen,
      fontSize: setResFontSize(17),
      fontWeight: FontWeight.w400);
  static TextStyle yellowFont = GoogleFonts.dmSans().copyWith(
      color: colorMainYellow,
      fontSize: setResFontSize(17),
      fontWeight: FontWeight.w400);

  static const Color kColorButtonPink = Color(0xFFFFE0E0);
  static const Color kColorButtonText = Color(0xFFFC312F);
  static const Color kColorButtonBorder = Color(0xFFFFCFCF);

  static const Color colorMainRed = Color(0xFFFC312F);
  static const Color colorMainLightRed = Color(0xFFFFCFCF);
  static const Color colorMainGreen = Color(0xFF45AB5D);
  static const Color colorLightMainGreen = Color(0xFF82D996);
  static const Color colorMainYellow = Color(0xFFFB8D46);
  static const Color colorLightYellow = Color(0xFFF98C45);
  static const Color colorSuperLightYellow = Color(0xFFFEEEE3);
  static const Color colorPink = Color(0xFFFFE0E0);
  static const Color colorPinkLight = Color(0xFFEECACA);
  static const Color colorPinkSuperLight = Color(0xFFF6F1F1);
  static const Color colorSoftPink = Color(0xFFF9F3F3);
  static const Color colorSoftBlue = Color(0xFF4193C0);
  static const Color colorDarkGrey = Color(0xFF1B252E);
  static const Color colorMediumDarkGrey = Color(0xFF254D71);
  static const Color colorGrey = Color(0xFF40576B);
  static const Color colorMediumLightGrey = Color(0xFFE1E6ED);
  static const Color colorGreyLight = Color(0xFF52708A);
  static const Color colorGreySuperLight = Color(0xFF8DA2B6);
  static const Color colorGreySuperLight2 = Color(0xFFE8ECF0);
  static const Color colorDarkWhite = Color(0xFFF2F4F5);
  static const Color colorSoftWhite = Color(0xFFF6F7FB);

  static Widget fourBubble(int index) {
    List<Widget> listBubble = [];
    for (var i = 0; i < 4; i++) {
      if (i != 0) {
        listBubble.add(UIHelper.horzSpace(13));
      }
      if (i + 1 == index) {
        listBubble.add(Container(
          height: UIHelper.setResHeight(7),
          width: UIHelper.setResWidth(7),
          decoration: BoxDecoration(
              color: UIHelper.colorMainRed, shape: BoxShape.circle),
        ));
        continue;
      }
      listBubble.add(Container(
        height: UIHelper.setResHeight(7),
        width: UIHelper.setResWidth(7),
        decoration: BoxDecoration(
            color: UIHelper.colorGreySuperLight, shape: BoxShape.circle),
      ));
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center, children: listBubble);
  }
}
