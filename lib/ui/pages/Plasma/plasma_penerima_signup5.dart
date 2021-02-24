part of '../pages.dart';

class PlasmaPenerimaSignUp5 extends StatefulWidget {
  @override
  _PlasmaPenerimaSignUp5State createState() => _PlasmaPenerimaSignUp5State();
}

class _PlasmaPenerimaSignUp5State extends State<PlasmaPenerimaSignUp5> {
  bool isSetuju1 = false;
  bool isSetuju2 = false;
  @override
  Widget build(BuildContext context) {
    return PlasmaDefaultTemplate(
      SizedBox(
        child: Column(
          children: [
            generateCheckBox(
                title:
                    "Saya menyatakan bahwa seluruh data yang saya masukkan benar adanya dan saya bertanggungjawab penuh atas kebenaran data - data tersebut",
                value: isSetuju1,
                onChange: (value) {
                  setState(() {
                    isSetuju1 = value;
                  });
                }),
            UIHelper.vertSpace(30),
            generateCheckBox(
                title:
                    "Saya mewakili pihak lain dalam pendaftaran ini. Saya menyatakan bahwa pihak yang bersangkutan telah memberi izin kepada saya",
                value: isSetuju2,
                onChange: (value) {
                  setState(() {
                    isSetuju2 = value;
                  });
                }),
            UIHelper.vertSpace(20),
          ],
        ),
      ),
      space: 5,
      addHeader: false,
      // desc: "Centang",
      // header: "Daftar Menjadi Penerima",
      goTo: GoToPlasmaPenerimaSignUp5(),
      backTo: GoToPlasmaPenerimaSignUp4(),
    );
  }
}
