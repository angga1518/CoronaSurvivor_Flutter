part of '../pages.dart';

class PlasmaPendonorSignUp2 extends StatefulWidget {
  Pengguna pengguna;
  PemberiDonor penerima;
  PlasmaPendonorSignUp2(this.pengguna, this.penerima);

  @override
  _PlasmaPendonorSignUp2State createState() => _PlasmaPendonorSignUp2State();
}

class _PlasmaPendonorSignUp2State extends State<PlasmaPendonorSignUp2> {
  String selectedGolDarah;
  List<String> listGolDarah = ["A", "B", "O"];

  String selectedRhesus;
  List<String> listRhesus = ["+", "-"];

  String selectedMelahirkan;
  List<String> listMelahirkan = ["Pernah", "Belum Pernah"];

  bool isAlreadyOpen = false;
  TextEditingController tanggalInfeksiController = TextEditingController();
  TextEditingController tanggalSembuhController = TextEditingController();
  TextEditingController beratBadanController = TextEditingController();
  TextEditingController catatanTambahanController = TextEditingController();

  bool istanggalInfeksiValid = true;
  bool istanggalSembuhValid = true;

  void setUpController(PemberiDonor penerima) {
    selectedGolDarah = penerima.golonganDarah;
    selectedRhesus = penerima.rhesus;
    selectedMelahirkan = penerima.melahirkan;
    tanggalInfeksiController.text = penerima.tanggalInfeksi;
    tanggalSembuhController.text = penerima.tanggalSembuh;
    beratBadanController.text = penerima.beratBadan.toString();
    catatanTambahanController.text = penerima.catatanTambahan;
    isAlreadyOpen = true;
  }

  @override
  void initState() {
    super.initState();
    if (widget.penerima.jenisKelamin != "Perempuan") {
      widget.penerima.melahirkan = "Belum Pernah";
    }
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
                (widget?.penerima?.tanggalInfeksi != null)
                    ? widget.penerima.tanggalInfeksi
                    : "yyyy/MM/dd",
                "Tanggal Infeksi", (value) {
              setState(() {
                isAlreadyOpen = true;
                tanggalInfeksiController.text = value;
                istanggalInfeksiValid = tanggalValidation(value);
                widget.penerima.tanggalInfeksi = value;
              });
            }, false,
                isValid: istanggalInfeksiValid,
                errorText: "Format tidak sesuai",
                isDate: true,
                suffixIcon: Icon(Icons.calendar_today)),
            UIHelper.vertSpace(5),
            TextFieldWidget(
                (widget?.penerima?.tanggalSembuh != null)
                    ? widget.penerima.tanggalSembuh
                    : "yyyy/MM/dd",
                "Tanggal Sembuh", (value) {
              setState(() {
                isAlreadyOpen = true;
                tanggalSembuhController.text = value;
                istanggalSembuhValid = tanggalValidation(value);
                widget.penerima.tanggalSembuh = value;
              });
            }, false,
                isValid: istanggalSembuhValid,
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
            (widget.penerima.jenisKelamin == "Perempuan")
                ? DropdownTextField(
                    items: listMelahirkan,
                    value: selectedMelahirkan,
                    hintText: "Pernah Melahirkan",
                    onChange: (String value) {
                      setState(() {
                        isAlreadyOpen = true;
                        selectedMelahirkan = value;
                        widget.penerima.melahirkan = value;
                      });
                    })
                : Container(),
            UIHelper.vertSpace(20),
          ],
        ),
      ),
      desc: "Masukkan keterangan diri Anda sebagai penerima donor ",
      header: "Daftar Menjadi Penerima",
      goTo: GoToPlasmaPendonorSignUp3(widget.pengguna, widget.penerima),
      backTo: GoToPlasmaPendonorSignUp1(widget.pengguna, widget.penerima),
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
