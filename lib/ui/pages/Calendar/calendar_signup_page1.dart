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
  TextEditingController jenisKelaminController = TextEditingController();
  TextEditingController domisiliController =
      TextEditingController(text: "Jakarta Selatan");
  TextEditingController noTeleponController =
      TextEditingController(text: "081532453621");
  TextEditingController emailController =
      TextEditingController(text: "sigigibesar@gmail.com");
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isPassConfirmAlreadyOpen = false;
  bool isAlreadyOpen = false;
  bool isEmailValid = true;
  bool isPassValid = true;
  bool isTanggalValid = true;
  int filled = 0;

  String selectedGender;
  List<String> listGender = ["Laki-Laki", "Perempuan"];

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            color: UIHelper.colorDarkWhite,
            child: ListView(
              children: [
                Column(
                  children: [
                    UIHelper.vertSpace(40),
                    SizedBox(
                      height: UIHelper.setResHeight(45),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: UIHelper.setResWidth(10),
                            vertical: UIHelper.setResHeight(10)),
                        width: UIHelper.setResWidth(322),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            SizedBox(
                              child: Column(
                                children: [
                                  UIHelper.vertSpace(10),
                                  SizedBox(
                                    width: UIHelper.setResWidth(280),
                                    child: Text("Buat MyCalender",
                                        style: UIHelper.greyFont.copyWith(
                                            fontSize:
                                                UIHelper.setResFontSize(20),
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  UIHelper.vertSpace(3),
                                  SizedBox(
                                    width: UIHelper.setResWidth(280),
                                    child: Text("Lengkapi data diri Anda",
                                        style: UIHelper.greyLightFont.copyWith(
                                          fontSize: UIHelper.setResFontSize(13),
                                        )),
                                  ),
                                  UIHelper.vertSpace(30),
                                  TextFieldWidget(
                                    "Nama Lengkap",
                                    "Nama Lengkap",
                                    (value) {
                                      // namaController.text = "Muhammad Erlangga";
                                      // isAlreadyOpen = true;
                                    },
                                    false,
                                    isValid: true,
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
                                  DropdownTextField(
                                      items: listGender,
                                      value: selectedGender,
                                      hintText: "Jenis Kelamin",
                                      onChange: (String value) {
                                        setState(() {
                                          isAlreadyOpen = true;
                                          selectedGender = value;
                                          print(selectedGender);
                                        });
                                      }),
                                  UIHelper.vertSpace(20),
                                  TextFieldWidget(
                                    "Domisili",
                                    "Domisili",
                                    (value) {
                                      // isAlreadyOpen = true;
                                      // domisiliController.text = value;
                                    },
                                    false,
                                    isValid: true,
                                    editable: false,
                                    controller: domisiliController,
                                  ),
                                  UIHelper.vertSpace(5),
                                  TextFieldWidget(
                                    "yyyy/MM/dd",
                                    "Tanggal Lahir",
                                    (value) {
                                      setState(() {
                                        // isAlreadyOpen = true;
                                        // tanggalLahirController.text = value;
                                        // isTanggalValid = tanggalValidation(value);
                                      });
                                    },
                                    false,
                                    isValid: isTanggalValid,
                                    errorText: "Format tidak sesuai",
                                    isDate: true,
                                    editable: false,
                                    controller: tanggalLahirController,
                                  ),
                                  UIHelper.vertSpace(5),
                                  TextFieldWidget(
                                    "Email",
                                    "Email",
                                    (value) {
                                      // setState(() {
                                      //   isAlreadyOpen = true;

                                      //   isEmailValid =
                                      //       EmailValidator.validate(value);
                                      //   emailController.text = value;
                                      // });
                                    },
                                    false,
                                    isValid: isEmailValid,
                                    isEmail: true,
                                    editable: false,
                                    controller: emailController,
                                    errorText: "Email tidak valid",
                                  ),
                                  UIHelper.vertSpace(5),
                                  TextFieldWidget(
                                    "",
                                    "Nomor Telepon",
                                    (value) {
                                      // isAlreadyOpen = true;
                                      // noTeleponController.text = value;
                                    },
                                    false,
                                    isValid: true,
                                    // prefixText: "+62 ",
                                    isNumber: true,
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
                                    isValid: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    UIHelper.vertSpace(20),
                    PinkButton(
                      "Lanjut",
                      () async {
                        // signup
                        // goto onboard
                        // showPopUp(context: context, child: PopUpLoadingChild());
                        // await Future.delayed(Duration(seconds: 1));
                        // Navigator.pop(context);
                        // prevPageEvent = GoToOnboardPage();
                        // SignInSignUpResult result = await AuthServices.signUp(
                        //     emailController.text,
                        //     confirmPasswordController.text,
                        //     namaController.text,
                        //     tanggalLahirController.text.replaceAll('/', '-'),
                        //     selectedGender,
                        //     domisiliController.text,
                        //     noTeleponController.text);
                        // if (result.pengguna == null) {
                        //   Flushbar(
                        //     animationDuration: Duration(milliseconds: 500),
                        //     duration: Duration(seconds: 4),
                        //     flushbarPosition: FlushbarPosition.TOP,
                        //     backgroundColor: UIHelper.colorGreyLight,
                        //     message: result.message,
                        //   )..show(context);
                        // }
                      },
                      // isEnabled: isEmailValid &&
                      //     isAlreadyOpen &&
                      //     isPassValid &&
                      //     isPassConfirmAlreadyOpen &&
                      //     isTanggalValid &&
                      //     namaController.text != "" &&
                      //     selectedGender != "" &&
                      //     domisiliController.text != "" &&
                      //     noTeleponController.text != "" &&
                      //     confirmPasswordController.text ==
                      //         passwordController.text),
                    ),
                    UIHelper.vertSpace(20),
                  ],
                )
              ],
            ),
          ),
          TopBar(
            "MyCalendar",
            () {
              pageBloc.add(GoToHomePage());
            },
          ),
        ],
      ),
    ));
  }
}

Widget generateTextField(TextEditingController controller, String labelText,
    String hintText, bool isEnabled,
    {String value = ""}) {
  controller.text = value;
  return SizedBox(
    height: UIHelper.setResHeight(40),
    width: UIHelper.setResWidth(270),
    child: TextField(
      textAlignVertical: TextAlignVertical.bottom,
      enabled: isEnabled,
      style: UIHelper.greyLightFont.copyWith(
          color: UIHelper.colorGreySuperLight,
          fontSize: UIHelper.setResFontSize(16)),
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: UIHelper.colorGreyLight, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: UIHelper.colorGreyLight,
        focusColor: UIHelper.colorGreyLight,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: labelText,
        labelStyle: TextStyle(color: UIHelper.colorGreyLight),
        hintText: hintText,
      ),
    ),
  );
}

Widget generateDropDownTextField(
    {@required List<String> items,
    @required String value,
    @required String hintText,
    @required Function onChange}) {
  return Container(
    height: UIHelper.setResHeight(40),
    width: UIHelper.setResWidth(270),
    padding: EdgeInsets.symmetric(horizontal: UIHelper.setResWidth(5)),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: UIHelper.colorGreyLight, width: 1.0)),
    child: DropdownButton(
        isExpanded: true,
        icon: Icon(Icons.arrow_drop_down),
        hint: Text(hintText,
            style: UIHelper.greyLightFont.copyWith(
                color: UIHelper.colorGreySuperLight,
                fontSize: UIHelper.setResFontSize(16))),
        value: value,
        style: UIHelper.greyLightFont.copyWith(
            color: UIHelper.colorGreySuperLight,
            fontSize: UIHelper.setResFontSize(16)),
        items: items
            .map((value) => DropdownMenuItem(value: value, child: Text(value)))
            .toList(),
        onChanged: (value) {
          onChange(value);
          // setState(() {
          //   selectedGender = value;
          // });
        }),
  );
}
