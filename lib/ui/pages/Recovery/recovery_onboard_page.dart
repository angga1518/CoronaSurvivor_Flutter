part of '../pages.dart';

class RecoveryOnboardPage extends StatefulWidget {
  @override
  _RecoveryOnboardPageState createState() => _RecoveryOnboardPageState();
}

class _RecoveryOnboardPageState extends State<RecoveryOnboardPage> {
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return RecoveryTemplate(
      child: SizedBox(
          child: Container(
        margin: EdgeInsets.only(bottom: UIHelper.setResHeight(10)),
        width: UIHelper.setResWidth(269),
        padding: EdgeInsets.symmetric(
            horizontal: UIHelper.setResWidth(10),
            vertical: UIHelper.setResHeight(10)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: UIHelper.colorMediumLightGrey)),
        child: Column(
          children: [
            SizedBox(
              child: Image(
                image: AssetImage("assets/note.png"),
                height: UIHelper.setResHeight(65),
                width: UIHelper.setResWidth(60),
              ),
            ),
            UIHelper.vertSpace(27),
            SizedBox(
              width: UIHelper.setResWidth(195),
              child: Text(
                "Anda belum mengisi perkembangan Anda hari ini",
                style: UIHelper.greyLightFont.copyWith(
                    fontSize: UIHelper.setResFontSize(12),
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            UIHelper.vertSpace(21),
            PinkButton("Isi Perkembangan", () async {
              await showPopUp(
                  context: context,
                  child: PopUpChild(
                      "Apakah Anda mengalami gejala yang berbeda dari sebelumnya?",
                      "Tambahkan gejala lainnya pada MyCalendar apabila Anda mengalami gejala lain",
                      () {
                    Navigator.pop(context);
                    pageBloc.add(GoToAddRecoveryPage());
                  }, () async {
                    Navigator.pop(context);
                  }));
            }, height: 29, fontSize: 10, width: 150),
            UIHelper.vertSpace(10),
          ],
        ),
      )),
      date: "01-10-2000",
      backTo: GoToCalendarHome(),
      withPinkButton: false,
    );
  }
}
