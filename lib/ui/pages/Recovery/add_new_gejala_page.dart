part of '../pages.dart';

class AddNewGejalaPage extends StatefulWidget {
  CalendarModel calendar;
  AddNewGejalaPage(this.calendar);
  @override
  _AddNewGejalaPageState createState() => _AddNewGejalaPageState();
}

class _AddNewGejalaPageState extends State<AddNewGejalaPage> {
  Gejala _gejala;

  List<Widget> generateGejalNotExisted() {
    List<Widget> children = [];
    List<Gejala> gejalayangSama = [];
    for (var i = 0; i < Gejala.values.length; i++) {
      Gejala gejala = Gejala.values[i];
      for (var i = 0; i < widget.calendar.listNamaGejala.length; i++) {
        Gejala converted =
            convertNamaToGejala(widget.calendar.listNamaGejala[i]);
        if (gejala == converted) {
          gejalayangSama.add(gejala);
        }
      }
    }
    for (var i = 0; i < Gejala.values.length; i++) {
      Gejala gejalaTemp = Gejala.values[i];
      if (!gejalayangSama.contains(gejalaTemp)) {
        children.add(generateRadionButton(_gejala, gejalaTemp, (Gejala gejala) {
          setState(() {
            _gejala = gejala;
          });
        }, convertGejalaToNama(gejalaTemp)));
      }
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return CalendarDefaultTemplate(
      SizedBox(
        child: Column(children: generateGejalNotExisted()),
      ),
      onPinkButtonTap: () async {
        List<String> listNamaGejala = [];
        listNamaGejala.add(convertGejalaToNama(_gejala));
        widget.calendar.listNamaGejala.add(convertGejalaToNama(_gejala));
        showPopUp(context: context, child: PopUpLoadingChild());
        widget.calendar = await GejalaService.createTambahanGejala(
                widget.calendar, listNamaGejala)
            .whenComplete(() => Navigator.pop(context));
        pageBloc.add(GoToSuccessPage(
            goTo: GoToAddRecoveryPage(widget.calendar),
            backTo: GoToRecoveryOnBoardPage(widget.calendar),
            pinkButtonMessage: "Isi Gejala",
            message:
                "Gejala Anda berhasil disimpan, silahkan isi gejala anda hari ini untuk mengabari tim dari Puskesmas"));
      },
      backTo: GoToRecoveryOnBoardPage(widget.calendar),
      goTo: null,
      desc: "Masukkan gejala yang Anda alami",
      header: "Tambah Gejala",
      pinkButtonTitle: "Kirim",
      bottomSpace: 80,
      space: 20,
      isEnabled: _gejala != null,
    );
  }
}

Widget generateRadionButton(
    Gejala groupValue, Gejala value, Function onChanged, String desc) {
  return Row(
    children: [
      UIHelper.horzSpace(10),
      Radio<Gejala>(
        activeColor: UIHelper.colorMainLightRed,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
      UIHelper.horzSpace(10),
      SizedBox(
        width: UIHelper.setResWidth(220),
        child: Text(
          desc,
          style: UIHelper.greyLightFont
              .copyWith(fontSize: UIHelper.setResFontSize(15)),
        ),
      ),
    ],
  );
}

Gejala convertNamaToGejala(String namaGejala) {
  switch (namaGejala) {
    case "Demam":
      return Gejala.Demam;
      break;
    case "Batuk":
      return Gejala.Batuk;
      break;
    case "Hilang Penciuman":
      return Gejala.Hilang_Penciuman;
      break;
    case "Kemampuan Penciuman Berkurang":
      return Gejala.Kemampuan_Penciuman_Berkurang;
      break;
    case "Hilang Pengecapan":
      return Gejala.Hilang_Pengecapan;
      break;
    case "Kemampuan Pengecapan Berkurang":
      return Gejala.Kemampuan_Pengecapan_Berkurang;
      break;
    case "Badan Pegal":
      return Gejala.Badan_Pegal;
      break;
    case "Meriang":
      return Gejala.Meriang;
      break;
    case "Pusing":
      return Gejala.Pusing;
      break;
    case "Mual":
      return Gejala.Mual;
      break;
    case "Muntah":
      return Gejala.Muntah;
      break;
    case "Selera Makan Berkurang":
      return Gejala.Selera_Makan_Berkurang;
      break;
  }
}

String convertGejalaToNama(Gejala gejala) {
  switch (gejala) {
    case Gejala.Demam:
      return "Demam";
      break;
    case Gejala.Batuk:
      return "Batuk";
      break;
    case Gejala.Hilang_Penciuman:
      return "Hilang Penciuman";
      break;
    case Gejala.Kemampuan_Penciuman_Berkurang:
      return "Kemampuan Penciuman Berkurang";
      break;
    case Gejala.Hilang_Pengecapan:
      return "Hilang Pengecapan";
      break;
    case Gejala.Kemampuan_Pengecapan_Berkurang:
      return "Kemampuan Pengecapan Berkurang";
      break;
    case Gejala.Badan_Pegal:
      return "Badan Pegal";
      break;
    case Gejala.Meriang:
      return "Meriang";
      break;
    case Gejala.Pusing:
      return "Pusing";
      break;
    case Gejala.Mual:
      return "Mual";
      break;
    case Gejala.Muntah:
      return "Muntah";
      break;
    case Gejala.Selera_Makan_Berkurang:
      return "Selera Makan Berkurang";
      break;
  }
}

enum Gejala {
  Demam,
  Batuk,
  Hilang_Penciuman,
  Kemampuan_Penciuman_Berkurang,
  Hilang_Pengecapan,
  Kemampuan_Pengecapan_Berkurang,
  Badan_Pegal,
  Meriang,
  Pusing,
  Mual,
  Muntah,
  Selera_Makan_Berkurang
}
