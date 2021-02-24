part of '../pages.dart';

class PlasmaPenerimaSignUp1 extends StatefulWidget {
  @override
  PlasmaPenerimaSignUp1State createState() => PlasmaPenerimaSignUp1State();
}

class PlasmaPenerimaSignUp1State extends State<PlasmaPenerimaSignUp1> {
  TextEditingController nikController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController domisiliController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController noTeleponController = TextEditingController();

  bool isAlreadyOpen = false;
  bool isTanggalValid = true;
  bool isEmailValid = true;

  String selectedGender;
  List<String> listGender = ["Laki-Laki", "Perempuan"];

  @override
  Widget build(BuildContext context) {
    return PlasmaDefaultTemplate(
      SizedBox(
        child: Column(
          children: [
            TextFieldWidget(
              "Nama Lengkap",
              "Nama Lengkap",
              (value) {
                namaController.text = value;
                isAlreadyOpen = true;
              },
              false,
            ),
            UIHelper.vertSpace(5),
            TextFieldWidget(
              "NIK",
              "NIK",
              (value) {
                nikController.text = value;
                isAlreadyOpen = true;
              },
              false,
            ),
            UIHelper.vertSpace(5),
            TextFieldWidget(
              "Domisili",
              "Domisili",
              (value) {
                domisiliController.text = value;
                isAlreadyOpen = true;
              },
              false,
            ),
            UIHelper.vertSpace(5),
            TextFieldWidget("yyyy/MM/dd", "Tanggal Lahir", (value) {
              setState(() {
                isAlreadyOpen = true;
                tanggalLahirController.text = value;
                isTanggalValid = tanggalValidation(value);
              });
            }, false,
                isValid: isTanggalValid,
                errorText: "Format tidak sesuai",
                isDate: true,
                suffixIcon: Icon(Icons.calendar_today)),
            UIHelper.vertSpace(5),
            DropdownTextField(
                items: listGender,
                value: selectedGender,
                hintText: "Jenis Kelamin",
                onChange: (String value) {
                  setState(() {
                    isAlreadyOpen = true;
                    selectedGender = value;
                  });
                }),
            UIHelper.vertSpace(20),
            TextFieldWidget(
              "",
              "Nomor Telepon",
              (value) {
                isAlreadyOpen = true;
                noTeleponController.text = value;
              },
              false,
              prefixText: "+62 ",
              isNumber: true,
            ),
            UIHelper.vertSpace(5),
            TextFieldWidget(
              "Email",
              "Email",
              (value) {
                setState(() {
                  isAlreadyOpen = true;

                  isEmailValid = EmailValidator.validate(value);
                  emailController.text = value;
                });
              },
              false,
              isValid: isEmailValid,
              isEmail: true,
              errorText: "Email tidak valid",
            ),
            UIHelper.vertSpace(5),
          ],
        ),
      ),
      desc: "Lengkapi data diri Anda",
      header: "Daftar Menjadi Penerima",
      backTo: GoToPlasmaPage(),
      goTo: GoToPlasmaPenerimaSignUp2(),
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
