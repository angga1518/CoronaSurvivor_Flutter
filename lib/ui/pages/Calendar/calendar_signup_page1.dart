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
                          ],
                        )),
                    UIHelper.vertSpace(20),
                    PinkButton(
                      "Lanjut",
                      () async {
                        pageBloc.add(GoToCalendarSignUpPage2());
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
