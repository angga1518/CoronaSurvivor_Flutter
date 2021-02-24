part of '../pages.dart';

class PlasmaPenerimaSignUp2 extends StatefulWidget {
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
                  });
                }),
            UIHelper.vertSpace(20),
            TextFieldWidget("yyyy/MM/dd", "Tanggal Lahir", (value) {
              setState(() {
                isAlreadyOpen = true;
                tanggalPositifController.text = value;
                isTanggalPositifValid = tanggalValidation(value);
              });
            }, false,
                isValid: isTanggalPositifValid,
                errorText: "Format tidak sesuai",
                isDate: true,
                suffixIcon: Icon(Icons.calendar_today)),
            UIHelper.vertSpace(5),
            TextFieldWidget("yyyy/MM/dd", "Tanggal Lahir", (value) {
              setState(() {
                isAlreadyOpen = true;
                tanggalGejalaController.text = value;
                isTanggalGejalaValid = tanggalValidation(value);
              });
            }, false,
                isValid: isTanggalGejalaValid,
                errorText: "Format tidak sesuai",
                isDate: true,
                suffixIcon: Icon(Icons.calendar_today)),
            UIHelper.vertSpace(5),
            TextFieldWidget(
              "Berat Badan",
              "Berat Badan",
              (value) {
                beratBadanController.text = value;
                isAlreadyOpen = true;
              },
              false,
              isNumber: true,
            ),
            UIHelper.vertSpace(5),
            TextFieldWidget(
              "Catatan Tambahan",
              "Catatan Tambahan",
              (value) {
                catatanTambahanController.text = value;
                isAlreadyOpen = true;
              },
              false,
            ),
            UIHelper.vertSpace(5),
          ],
        ),
      ),
      desc: "Masukkan keterangan diri Anda sebagai penerima donor ",
      header: "Daftar Menjadi Penerima",
      goTo: GoToPlasmaPenerimaSignUp3(),
      backTo: GoToPlasmaPenerimaSignUp1(),
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
