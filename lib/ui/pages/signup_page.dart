part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController jenisKelaminController = TextEditingController();
  TextEditingController domisiliController = TextEditingController();
  TextEditingController noTeleponController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isPassConfirmAlreadyOpen = false;
  bool isAlreadyOpen = false;
  bool isEmailValid = true;
  bool isPassValid = true;
  bool isTanggalValid = true;

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
                                    child: Text("Daftar",
                                        style: UIHelper.greyFont.copyWith(
                                            fontSize:
                                                UIHelper.setResFontSize(20),
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  UIHelper.vertSpace(3),
                                  SizedBox(
                                    width: UIHelper.setResWidth(280),
                                    child: Text("Masukkan data diri Anda",
                                        style: UIHelper.greyLightFont.copyWith(
                                          fontSize: UIHelper.setResFontSize(13),
                                        )),
                                  ),
                                  UIHelper.vertSpace(30),
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
                                  TextFieldWidget("yyyy/MM/dd", "Tanggal Lahir",
                                      (value) {
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
                                    "Domisili",
                                    "Domisili",
                                    (value) {
                                      isAlreadyOpen = true;
                                      domisiliController.text = value;
                                    },
                                    false,
                                  ),
                                  UIHelper.vertSpace(5),
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

                                        isEmailValid =
                                            EmailValidator.validate(value);
                                        emailController.text = value;
                                      });
                                    },
                                    false,
                                    isValid: isEmailValid,
                                    isEmail: true,
                                    errorText: "Email tidak valid",
                                  ),
                                  UIHelper.vertSpace(5),
                                  TextFieldWidget(
                                    "Password",
                                    "Password",
                                    (value) {
                                      setState(() {
                                        isAlreadyOpen = true;

                                        isPassValid = (value.length >= 6);
                                        passwordController.text = value;
                                      });
                                    },
                                    true,
                                    isValid: isPassValid,
                                    errorText: "Password kurang dari 6 huruf",
                                  ),
                                  UIHelper.vertSpace(5),
                                  TextFieldWidget(
                                    "Konfirmasi Password",
                                    "Konfirmasi Password",
                                    (value) {
                                      setState(() {
                                        isAlreadyOpen = true;
                                        confirmPasswordController.text = value;
                                        isPassConfirmAlreadyOpen = true;
                                      });
                                    },
                                    true,
                                    isValid: confirmPasswordController.text ==
                                            passwordController.text ||
                                        !isPassConfirmAlreadyOpen,
                                    errorText: "Password tidak sama",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    UIHelper.vertSpace(20),
                    PinkButton("Buat Akun", () async {
                      // signup
                      // goto onboard
                      showPopUp(context: context, child: PopUpLoadingChild());
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pop(context);
                      prevPageEvent = GoToOnboardPage();
                      SignInSignUpResult result = await AuthServices.signUp(
                          emailController.text,
                          confirmPasswordController.text,
                          namaController.text,
                          tanggalLahirController.text.replaceAll('/', '-'),
                          selectedGender,
                          domisiliController.text,
                          noTeleponController.text);
                      if (result.pengguna == null) {
                        Flushbar(
                          animationDuration: Duration(milliseconds: 500),
                          duration: Duration(seconds: 4),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: UIHelper.colorGreyLight,
                          message: result.message,
                        )..show(context);
                      }
                    },
                        isEnabled: isEmailValid &&
                            isAlreadyOpen &&
                            isPassValid &&
                            isPassConfirmAlreadyOpen &&
                            isTanggalValid &&
                            namaController.text != "" &&
                            selectedGender != "" &&
                            domisiliController.text != "" &&
                            noTeleponController.text != "" &&
                            confirmPasswordController.text ==
                                passwordController.text),
                    UIHelper.vertSpace(20),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
