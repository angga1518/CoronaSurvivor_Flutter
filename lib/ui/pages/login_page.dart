part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
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
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: UIHelper.setResHeight(75),
                      ),
                      Text(
                        "Selamat Datang di aplikasi \n Lawan Covid Indonesia",
                        style: UIHelper.greyLightFont,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: UIHelper.setResHeight(20),
                      ),
                      TextFieldWidget("Email Address", "Email", null, false),
                      SizedBox(
                        height: UIHelper.setResHeight(25),
                      ),
                      TextFieldWidget("Password", "Password", null, false),
                      SizedBox(
                        height: UIHelper.setResHeight(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Belum Punya Akun?",
                              style: UIHelper.greyLightFont),
                          GestureDetector(
                            onTap: () {},
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
                      PinkButton("Masuk", () {})
                    ],
                  ),
                )
              ],
            ),
          )
        ],
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
