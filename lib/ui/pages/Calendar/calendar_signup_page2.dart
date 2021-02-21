part of '../pages.dart';

class CalendarSignUpPage2 extends StatefulWidget {
  @override
  CalendarSignUpPage2State createState() => CalendarSignUpPage2State();
}

class CalendarSignUpPage2State extends State<CalendarSignUpPage2> {
  TextEditingController beratBadanController = TextEditingController();
  TextEditingController tanggalPositifController = TextEditingController();
  TextEditingController tanggalGejalaController = TextEditingController();

  bool isAlreadyOpen = false;
  bool isBeratBadanFieldOpen = false;
  bool isTanggalPositifValid = true;
  bool isTanggalMunculGejalaValid = true;

  String selectedGender;

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
                                    "yyyy/MM/dd",
                                    "Tanggal Positif",
                                    (value) {
                                      setState(() {
                                        isAlreadyOpen = true;
                                        tanggalPositifController.text = value;
                                        isTanggalPositifValid =
                                            tanggalValidation(value);
                                      });
                                    },
                                    false,
                                    isValid: isTanggalPositifValid,
                                    errorText: "Format tidak sesuai",
                                    isDate: true,
                                    editable: true,
                                    suffixIcon: Icon(Icons.calendar_today),
                                  ),
                                  UIHelper.vertSpace(5),
                                  TextFieldWidget(
                                    "yyyy/MM/dd",
                                    "Tanggal Muncul Gejala",
                                    (value) {
                                      setState(() {
                                        isAlreadyOpen = true;
                                        tanggalGejalaController.text = value;
                                        isTanggalMunculGejalaValid =
                                            tanggalValidation(value);
                                      });
                                    },
                                    false,
                                    isValid: isTanggalMunculGejalaValid,
                                    errorText: "Format tidak sesuai",
                                    isDate: true,
                                    editable: true,
                                    suffixIcon: Icon(Icons.calendar_today),
                                  ),
                                  UIHelper.vertSpace(5),
                                  TextFieldWidget(
                                    "Berat Badan",
                                    "Berat Badan",
                                    (value) {
                                      isBeratBadanFieldOpen = true;
                                      beratBadanController.text = value;
                                    },
                                    false,
                                    isValid:
                                        beratBadanController.text.length > 0 ||
                                            !isBeratBadanFieldOpen,
                                    errorText: "Perlu diisi",
                                    isNumber: true,
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
                        pageBloc.add(GoToCalendarSignUpPage3());
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
