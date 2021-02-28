part of '../pages.dart';

class PlasmaPenerimaSignUp1 extends StatefulWidget {
  Pengguna pengguna;
  PenerimaDonor penerima;
  PlasmaPenerimaSignUp1(this.pengguna, this.penerima);
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

  void setUpController(PenerimaDonor penerima) {
    selectedGender = penerima.jenisKelamin;
    namaController.text = penerima.namaLengkap;
    nikController.text = penerima.nik;
    domisiliController.text = penerima.domisili;
    tanggalLahirController.text = penerima.tanggalLahir;
    noTeleponController.text = penerima.noTelepon;
    emailController.text = penerima.email;
  }

  @override
  void initState() {
    super.initState();
    widget.penerima.emailPendaftar = widget.pengguna.email;
    widget.penerima.tanggalSimpan =
        widget.penerima.generateTanggalSimpan().toString();
    if (widget?.penerima?.gejala == null) {
      widget.penerima.gejala = new List<String>();
    }

    if (widget?.penerima?.riwayatPenyakit == null) {
      widget.penerima.riwayatPenyakit = new List<String>();
    }
    if (widget?.penerima?.namaLengkap != null) {
      this.isAlreadyOpen = true;
      setUpController(widget.penerima);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlasmaDefaultTemplate(
      SizedBox(
        child: Column(
          children: [
            TextFieldWidget(
              (widget?.penerima?.namaLengkap != null)
                  ? widget.penerima.namaLengkap
                  : "Nama Lengkap",
              "Nama Lengkap",
              (value) {
                namaController.text = value;
                isAlreadyOpen = true;
                widget.penerima.namaLengkap = value;
              },
              false,
            ),
            UIHelper.vertSpace(5),
            TextFieldWidget(
              (widget?.penerima?.nik != null) ? widget.penerima.nik : "NIK",
              "NIK",
              (value) {
                nikController.text = value;
                isAlreadyOpen = true;
                widget.penerima.nik = value;
              },
              false,
            ),
            UIHelper.vertSpace(5),
            TextFieldWidget(
              (widget?.penerima?.domisili != null)
                  ? widget.penerima.domisili
                  : "Domisili",
              "Domisili",
              (value) {
                domisiliController.text = value;
                isAlreadyOpen = true;
                widget.penerima.domisili = value;
              },
              false,
            ),
            UIHelper.vertSpace(5),
            TextFieldWidget(
                (widget?.penerima?.tanggalLahir != null)
                    ? widget.penerima.tanggalLahir
                    : "yyyy/MM/dd",
                "Tanggal Lahir", (value) {
              setState(() {
                isAlreadyOpen = true;
                tanggalLahirController.text = value;
                isTanggalValid = tanggalValidation(value);
                widget.penerima.tanggalLahir = value;
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
                    widget.penerima.jenisKelamin = value;
                  });
                }),
            UIHelper.vertSpace(20),
            TextFieldWidget(
              (widget?.penerima?.noTelepon != null)
                  ? widget.penerima.noTelepon
                  : "No Telepon",
              "No Telepon",
              (value) {
                isAlreadyOpen = true;
                noTeleponController.text = value;
                widget.penerima.noTelepon = value;
              },
              false,
              prefixText: "+62 ",
              isNumber: true,
            ),
            UIHelper.vertSpace(5),
            TextFieldWidget(
              (widget?.penerima?.email != null)
                  ? widget.penerima.email
                  : "Email",
              "Email",
              (value) {
                setState(() {
                  isAlreadyOpen = true;

                  isEmailValid = EmailValidator.validate(value);
                  emailController.text = value;
                  widget.penerima.email = value;
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
      isEnabled: namaController.text != ""
      // &&
      //     nikController.text != "" &&
      //     domisiliController.text != "" &&
      //     isTanggalValid &&
      //     selectedGender != "" &&
      //     noTeleponController.text != "" &&
      //     emailController.text != ""
      ,
      desc: "Lengkapi data diri Anda",
      header: "Daftar Menjadi Penerima",
      backTo: GoToPlasmaPage(widget.pengguna),
      goTo: GoToPlasmaPenerimaSignUp2(widget.pengguna, widget.penerima),
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
