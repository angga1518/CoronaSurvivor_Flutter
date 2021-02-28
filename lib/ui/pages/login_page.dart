part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAlreadyOpen = false;
  bool isEmailValid = true;
  bool isPassValid = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: UIHelper.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment
                      .topRight, // 10% of the width, so there are ten blinds.
                  colors: [
                    const Color(0xFFEB3549),
                    const Color(0xFFF35844)
                  ], // red to yellow
                ),
              ),
            ),
            Container(
              height: UIHelper.setResHeight(360),
              width: UIHelper.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background_splashscreen.png"),
                      fit: BoxFit.cover)),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: UIHelper.setResHeight(70),
                  ),
                  Container(
                    height: UIHelper.setResHeight(120),
                    width: UIHelper.setResWidth(270),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/login_logo_covid.png"),
                            fit: BoxFit.cover)),
                  ),
                  Text(
                    "#IndonesiaBebasCovid",
                    style: UIHelper.whiteFont,
                  ),
                  SizedBox(
                    height: UIHelper.setResHeight(40),
                  ),
                  Container(
                    height: UIHelper.setResHeight(386),
                    width: UIHelper.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        UIHelper.vertSpace(30),
                        Text(
                          "Selamat Datang di aplikasi \n Lawan Covid Indonesia",
                          style: UIHelper.greyLightFont,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: UIHelper.setResHeight(20),
                        ),
                        TextFieldWidget(
                          "Email Address",
                          "Email",
                          (value) {
                            setState(() {
                              isEmailValid = EmailValidator.validate(value);
                              emailController.text = value;
                              isAlreadyOpen = true;
                            });
                          },
                          false,
                          isValid: isEmailValid,
                          errorText: "Email tidak valid",
                        ),
                        UIHelper.vertSpace(10),
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
                        SizedBox(
                          height: UIHelper.setResHeight(20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Belum Punya Akun?",
                                style: UIHelper.greyLightFont),
                            GestureDetector(
                              onTap: () {
                                pageBloc.add(GoToSignupPage());
                              },
                              child: Text(
                                " DAFTAR",
                                style: UIHelper.redFont.copyWith(
                                    fontSize: UIHelper.setResFontSize(13),
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: UIHelper.setResHeight(30),
                        ),
                        PinkButton(
                          "Masuk",
                          () async {
                            showPopUp(
                                context: context, child: PopUpLoadingChild());
                            await Future.delayed(Duration(seconds: 1));
                            Navigator.pop(context);
                            SignInSignUpResult result =
                                await AuthServices.signIn(emailController.text,
                                    passwordController.text);
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
                          isEnabled:
                              isEmailValid && isAlreadyOpen && isPassValid,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// RichText(
//           text: TextSpan(
//             text: 'Lawan',
//             style: UIHelper.redFont.copyWith(
//                 fontSize: UIHelper.setResFontSize(fontLawan),
//                 fontWeight: FontWeight.w400),
//             children: <TextSpan>[
//               TextSpan(
//                   text: 'Covid',
//                   style: UIHelper.redFont.copyWith(
//                       fontSize: UIHelper.setResFontSize(fontCovid),
//                       fontWeight: FontWeight.w700))
