part of '../pages.dart';

class PlasmaPenerimaSignUp5 extends StatefulWidget {
  Pengguna pengguna;
  PenerimaDonor penerima;
  PlasmaPenerimaSignUp5(this.pengguna, this.penerima);
  @override
  _PlasmaPenerimaSignUp5State createState() => _PlasmaPenerimaSignUp5State();
}

class _PlasmaPenerimaSignUp5State extends State<PlasmaPenerimaSignUp5> {
  bool isSetuju1 = false;
  bool isSetuju2 = false;
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
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
                  widget.penerima.himself = true;
                }),
            UIHelper.vertSpace(20),
          ],
        ),
      ),
      space: 5,
      addHeader: false,
      // desc: "Centang",
      // header: "Daftar Menjadi Penerima",
      isEnabled: isSetuju1,
      goTo: null,
      backTo: GoToPlasmaPenerimaSignUp4(widget.pengguna, widget.penerima),
      onPinkButtonTap: () async {
        showPopUp(context: context, child: PopUpLoadingChild());
        await PenerimaDonorService.createPenerimaDonor(widget.penerima)
            .whenComplete(() => Navigator.pop(context));
        pageBloc.add(GoToPlasmaPage(widget.pengguna));
        // showPopUp(context: context, child: PopUpLoadingChild());
        // await Future.delayed(Duration(seconds: 1));
        // Navigator.pop(context);

        // PenerimaDonor result =
        //     await PenerimaDonorService.createPenerimaDonor(widget.penerima);
        // if (result == null) {
        //   Flushbar(
        //     animationDuration: Duration(milliseconds: 500),
        //     duration: Duration(seconds: 4),
        //     flushbarPosition: FlushbarPosition.TOP,
        //     backgroundColor: UIHelper.colorGreyLight,
        //     message: "Terjadi kesalahan",
        //   )..show(context);
        // }
      },
    );
  }
}
