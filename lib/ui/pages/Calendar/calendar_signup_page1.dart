part of '../pages.dart';

class CalendarSignUpPage1 extends StatefulWidget {
  CalendarModel calendarModel;
  CalendarSignUpPage1(this.calendarModel);
  @override
  CalendarSignUpPage1State createState() => CalendarSignUpPage1State();
}

class CalendarSignUpPage1State extends State<CalendarSignUpPage1> {
  TextEditingController namaController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController jenisKelaminController = TextEditingController();
  TextEditingController domisiliController = TextEditingController();
  TextEditingController noTeleponController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isAlreadyOpen = false;

  void setUpController(Pengguna pengguna) {
    namaController.text = pengguna.namaLengkap;
    tanggalLahirController.text = pengguna.getTanggalLahir();
    jenisKelaminController.text = pengguna.jenisKelamin;
    domisiliController.text = pengguna.domisili;
    // noTeleponController.text = pengguna.noTelepon;wi
    emailController.text = pengguna.email;
  }

  @override
  void initState() {
    super.initState();
    setUpController(widget.calendarModel.pengguna);
    nikController.text = widget.calendarModel.nik;
    isAlreadyOpen = nikController.text != "";
  }

  @override
  Widget build(BuildContext context) {
    return CalendarDefaultTemplate(
        SizedBox(
          child: Column(
            children: [
              TextFieldWidget(
                "Nama Lengkap",
                "Nama Lengkap",
                null,
                false,
                editable: false,
                controller: namaController,
              ),
              UIHelper.vertSpace(5),
              TextFieldWidget(
                "NIK",
                "NIK",
                (value) {
                  setState(() {
                    isAlreadyOpen = true;
                    widget.calendarModel.nik = value;
                  });
                },
                false,
                controller: nikController,
                isValid: true,
                isNumber: true,
              ),
              UIHelper.vertSpace(5),
              TextFieldWidget(
                "Jenis Kelamin",
                "Jenis Kelamin",
                null,
                false,
                editable: false,
                controller: jenisKelaminController,
              ),
              UIHelper.vertSpace(5),
              TextFieldWidget(
                "Domisili",
                "Domisili",
                null,
                false,
                editable: false,
                controller: domisiliController,
              ),
              UIHelper.vertSpace(5),
              TextFieldWidget(
                "yyyy/MM/dd",
                "Tanggal Lahir",
                null,
                false,
                editable: false,
                controller: tanggalLahirController,
              ),
              UIHelper.vertSpace(5),
              TextFieldWidget(
                "Email",
                "Email",
                null,
                false,
                editable: false,
                controller: emailController,
              ),
              UIHelper.vertSpace(5),
              TextFieldWidget(
                "",
                "Nomor Telepon",
                null,
                false,
                prefixText: "+62 ",
                controller: noTeleponController,
                editable: false,
              ),
              UIHelper.vertSpace(5),
            ],
          ),
        ),
        bottomSpace: 70,
        isEnabled: isAlreadyOpen && nikController.text != "",
        desc: "Lengkapi data diri Anda",
        goTo: GoToCalendarSignUpPage2(widget.calendarModel),
        backTo: GoToCalendarOnboardPage(widget.calendarModel.pengguna,
            calendarModel: widget.calendarModel));
  }
}
