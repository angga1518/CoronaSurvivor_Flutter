part of '../pages.dart';

class PlasmaPenerimaSignUp2 extends StatefulWidget {
  Pengguna pengguna;
  PenerimaDonor penerima;
  PlasmaPenerimaSignUp2(this.pengguna, this.penerima);

  @override
  _PlasmaPenerimaSignUp2State createState() => _PlasmaPenerimaSignUp2State();
}

class _PlasmaPenerimaSignUp2State extends State<PlasmaPenerimaSignUp2> {
  String selectedGolDarah;
  List<String> listGolDarah = ["A", "B", "O"];

  String selectedRhesus;
  List<String> listRhesus = ["+", "-"];

  bool isAlreadyOpen = false;
  TextEditingController tanggalPositifController = TextEditingController();
  TextEditingController tanggalGejalaController = TextEditingController();
  TextEditingController beratBadanController = TextEditingController();
  TextEditingController catatanTambahanController = TextEditingController();

  bool isTanggalPositifValid = true;
  bool isTanggalGejalaValid = true;

  void setUpController(PenerimaDonor penerima) {
    selectedGolDarah = penerima.golonganDarah;
    selectedRhesus = penerima.rhesus;
    tanggalPositifController.text = penerima.tanggalPositif;
    tanggalGejalaController.text = penerima.tanggalGejala;
    beratBadanController.text = penerima.beratBadan.toString();
    catatanTambahanController.text = penerima.catatanTambahan;
    isAlreadyOpen = true;
  }

  @override
  void initState() {
    super.initState();
    if (widget?.penerima?.namaLengkap != null) {
      setUpController(widget.penerima);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlasmaDefaultTemplate(
      SizedBox(
        child: Column(
          children: [
            DropdownTextField(
                items: listGolDarah,
                value: selectedGolDarah,
                hintText: "Golongan Darah",
                onChange: (String value) {
                  setState(() {
                    isAlreadyOpen = true;
                    selectedGolDarah = value;
                    widget.penerima.golonganDarah = value;
                  });
                }),
            UIHelper.vertSpace(20),
            DropdownTextField(
                items: listRhesus,
                value: selectedRhesus,
                hintText: "Rhesus",
                onChange: (String value) {
                  setState(() {
                    isAlreadyOpen = true;
                    selectedRhesus = value;
                    widget.penerima.rhesus = value;
                  });
                }),
            UIHelper.vertSpace(20),
            TextFieldWidget(
                (widget?.penerima?.tanggalPositif != null)
                    ? widget.penerima.tanggalPositif
                    : "yyyy/MM/dd",
                "Tanggal Positif", (value) {
              setState(() {
                isAlreadyOpen = true;
                tanggalPositifController.text = value;
                isTanggalPositifValid = tanggalValidation(value);
                widget.penerima.tanggalPositif = value;
              });
            }, false,
                isValid: isTanggalPositifValid,
                errorText: "Format tidak sesuai",
                isDate: true,
                suffixIcon: Icon(Icons.calendar_today)),
            UIHelper.vertSpace(5),
            TextFieldWidget(
                (widget?.penerima?.tanggalGejala != null)
                    ? widget.penerima.tanggalGejala
                    : "yyyy/MM/dd",
                "Tanggal Gejala", (value) {
              setState(() {
                isAlreadyOpen = true;
                tanggalGejalaController.text = value;
                isTanggalGejalaValid = tanggalValidation(value);
                widget.penerima.tanggalGejala = value;
              });
            }, false,
                isValid: isTanggalGejalaValid,
                errorText: "Format tidak sesuai",
                isDate: true,
                suffixIcon: Icon(Icons.calendar_today)),
            UIHelper.vertSpace(5),
            TextFieldWidget(
              (widget?.penerima?.beratBadan != null)
                  ? widget.penerima.beratBadan
                  : "Berat Badan",
              "Berat Badan",
              (value) {
                beratBadanController.text = value;
                isAlreadyOpen = true;
                widget.penerima.beratBadan = value;
              },
              false,
              isNumber: true,
            ),
            UIHelper.vertSpace(5),
            TextFieldWidget(
              (widget?.penerima?.catatanTambahan != null)
                  ? widget.penerima.catatanTambahan
                  : "Nama Lengkap",
              "Catatan Tambahan",
              (value) {
                catatanTambahanController.text = value;
                isAlreadyOpen = true;
                widget.penerima.catatanTambahan = value;
              },
              false,
            ),
            UIHelper.vertSpace(5),
          ],
        ),
      ),
      desc: "Masukkan keterangan diri Anda sebagai penerima donor ",
      header: "Daftar Menjadi Penerima",
      goTo: GoToPlasmaPenerimaSignUp3(widget.pengguna, widget.penerima),
      backTo: GoToPlasmaPenerimaSignUp1(widget.pengguna, widget.penerima),
    );
  }

  bool tanggalValidation(String tanggal) {
    List<String> details = tanggal.split("/");
    if (details.length != 3) {
      return false;
    }
    if (details[0].length != 4) {
      return false;
    }
    if (details[1].length != 2) {
      return false;
    }
    if (details[2].length != 2) {
      return false;
    }
    return true;
  }
}
