part of 'pages.dart';

class SuccessPage extends StatefulWidget {
  final String message;
  final String pinkButtonMessage;
  final PageEvent goTo;
  final PageEvent backTo;
  SuccessPage(this.message, this.goTo, this.backTo, this.pinkButtonMessage);
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return WillPopScope(
      onWillPop: () {
        pageBloc.add(widget.backTo);
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
                      widget.message,
                      style: UIHelper.greyFont.copyWith(
                          fontSize: UIHelper.setResFontSize(15),
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  UIHelper.vertSpace(80),
                  PinkButton(widget.pinkButtonMessage, () {
                    pageBloc.add(widget.goTo);
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
