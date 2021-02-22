part of '../pages.dart';

class CalendarSignUpPage1 extends StatefulWidget {
  @override
  CalendarSignUpPage1State createState() => CalendarSignUpPage1State();
}

class CalendarSignUpPage1State extends State<CalendarSignUpPage1> {
  TextEditingController namaController =
      TextEditingController(text: "Muhammad Erlangga");
  TextEditingController nikController = TextEditingController();
  TextEditingController puskesmasController = TextEditingController();
  TextEditingController tanggalLahirController =
      TextEditingController(text: "30/03/2000");
  TextEditingController jenisKelaminController =
      TextEditingController(text: "Laki-Laki");
  TextEditingController domisiliController =
      TextEditingController(text: "Jakarta Selatan");
  TextEditingController noTeleponController =
      TextEditingController(text: "81532453621");
  TextEditingController emailController =
      TextEditingController(text: "sigigibesar@gmail.com");
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isAlreadyOpen = false;

  String selectedGender;
  List<String> listGender = ["Laki-Laki", "Perempuan"];

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
                isAlreadyOpen = true;
                nikController.text = value;
              },
              false,
              isValid: true,
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
            TextFieldWidget(
              "Puskesmas Acuan",
              "Puskesmas Acuan",
              (value) {
                isAlreadyOpen = true;
                puskesmasController.text = value;
              },
              false,
            ),
          ],
        ),
      ),
      desc: "Lengkapi data diri Anda",
      goTo: GoToCalendarSignUpPage2(),
      backTo: GoToCalendarOnboardPage(),
    );
  }
}
