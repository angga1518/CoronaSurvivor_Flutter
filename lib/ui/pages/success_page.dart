part of 'pages.dart';

class SuccessPage extends StatefulWidget {
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return WillPopScope(
      onWillPop: () {
        pageBloc.add(GoToConnectPuskesmasPage());
        Future.value(false);
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: UIHelper.colorDarkWhite,
            ),
            Container(
              width: UIHelper.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UIHelper.vertSpace(124),
                  SizedBox(
                    child: Image(
                      image: AssetImage("assets/success.png"),
                      height: UIHelper.setResHeight(140),
                      width: UIHelper.setResWidth(140),
                    ),
                  ),
                  UIHelper.vertSpace(50),
                  Logo(37, 14, 17, 140),
                  UIHelper.vertSpace(15),
                  SizedBox(
                    width: UIHelper.setResWidth(266),
                    child: Text(
                      "MyCalendar Anda berhasil terhubung dengan Puskesmas Depok! Laporan Anda selanjutnya akan diberikan feedback oleh pihak puskesmas",
                      style: UIHelper.greyFont.copyWith(
                          fontSize: UIHelper.setResFontSize(15),
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  UIHelper.vertSpace(80),
                  PinkButton("Kembali ke Info", () {
                    pageBloc.add(GoToCalendarHome());
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
