part of 'pages.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String messageTitle = "Empty";
  String notificationAlert = "alert";

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String token = "";

  @override
  void initState() {
    super.initState();
    _checkNewToken().then((_) {
      setState(() {});
    });
    firebaseMessagingConfiguration();
  }

  void firebaseMessagingConfiguration() {
    _firebaseMessaging.configure(
      onMessage: (message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (message) async {
        print("onResume: $message");
      },
    );
  }

  Future<void> _checkNewToken() async {
    token = await _firebaseMessaging.getToken();
    tokenFCM = token;
    print("token nih: " + token);
  }

  @override
  Widget build(BuildContext context) {
    UIHelper(context);
    User user = Provider.of<User>(context);
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    CalendarBloc calendarBloc = BlocProvider.of<CalendarBloc>(context);

    // pageBloc.add(GoToRecoveryDetailPage());
    if (user == null) {
      // for dev
      // pageBloc.add(GoToCalendarSignUpPage1());
      if (!(prevPageEvent is GoToSplashPage ||
          prevPageEvent is GoToOnboardPage)) {
        prevPageEvent = GoToSplashPage();
        pageBloc.add(prevPageEvent);
      }
    } else {
      if (prevPageEvent is GoToOnboardPage) {
        prevPageEvent = GoToHomePage();
        userBloc.add(LoadUser(user.email));
        calendarBloc.add(LoadCalendar(emailPengguna: user.email));
        pageBloc.add(GoToOnboardPage());
      }
      if (!(prevPageEvent is GoToHomePage)) {
        prevPageEvent = GoToHomePage();
        userBloc.add(LoadUser(user.email));
        calendarBloc.add(LoadCalendar(emailPengguna: user.email));
        pageBloc.add(prevPageEvent);
      }
    }
    return BlocBuilder<PageBloc, PageState>(
      builder: (context, state) {
        if (state is OnSplashPage) {
          return SplashPage();
        } else if (state is OnHomePage) {
          return HomePage();
        } else if (state is OnLoginPage) {
          return LoginPage();
        } else if (state is OnSignupPage) {
          return SignUpPage();
        } else if (state is OnOnboardPage) {
          return OnboardPage();
        } else if (state is OnProfilePage) {
          return ProfilePage(state.pengguna);
        } else if (state is OnDonorGiverPage) {
          return DonorGiverPage(state.pengguna, state.pemberiDonor);
        } else if (state is OnDonorReceiverPage) {
          return DonorReceiverPage(state.pengguna, state.penerimaDonor);
        } else if (state is OnInfoPage) {
          return InfoPage(
            idArtikel: state.idArtikel,
            mapLikedKomentar: state.mapLikedKomentar,
            pengguna: state.pengguna,
            isLikedArtikel: state.isLikedArtikel,
          );
        } else if (state is OnDetailInfoPage) {
          return DetailInfo(
            state.artikel,
            state.pengguna,
            state.listKomentar,
            tempIconLikeArtikel: state.tempIconLikeArtikel,
          );
        } else if (state is OnAddCommentPage) {
          return AddCommentPage(state.artikel, state.pengguna, state.isReply,
              state.namaReplied, state.idParentKomentar, state.listKomentar);
        } else if (state is OnCalendarOnboardPage) {
          return CalendarOnboardPage(state.pengguna,
              calendarModel: state.calendarModel);
        } else if (state is OnCalendarSignUpPage1) {
          return CalendarSignUpPage1(state.calendarModel);
        } else if (state is OnCalendarSignUpPage2) {
          return CalendarSignUpPage2(state.calendarModel);
        } else if (state is OnCalendarSignUpPage3) {
          return CalendarSignUpPage3(state.calendarModel);
        } else if (state is OnCalendarSignUpPage4) {
          return CalendarSignUpPage4(state.calendarModel);
        } else if (state is OnCalendarSignUpPage5) {
          return CalendarSignUpPage5(state.calendarModel);
        } else if (state is OnCalendarHome) {
          return CalendarHomePage(state.calendarModel);
        } else if (state is OnConnectPuskesmasPage) {
          return ConnectPuskesPage(state.calendarModel);
        } else if (state is OnSuccessPage) {
          return SuccessPage(
              state.message, state.goTo, state.backTo, state.pinkButtonMessage);
        } else if (state is OnRecoveryOnBoardPage) {
          return RecoveryOnboardPage(state.calendar);
        } else if (state is OnAddRecoveryPage) {
          return AddRecoveryPage(state.calendar);
        } else if (state is OnAddNewGejalaPage) {
          return AddNewGejalaPage(state.calendar);
        } else if (state is OnRecoveryDetailPage) {
          return RecoveryDetailPage(state.calendar, state.recovery);
        } else if (state is OnPlasmaPenerimaSignUp1) {
          return PlasmaPenerimaSignUp1(state.pengguna, state.penerima);
        } else if (state is OnPlasmaPenerimaSignUp2) {
          return PlasmaPenerimaSignUp2(state.pengguna, state.penerima);
        } else if (state is OnPlasmaPenerimaSignUp3) {
          return PlasmaPenerimaSignUp3(state.pengguna, state.penerima);
        } else if (state is OnPlasmaPenerimaSignUp4) {
          return PlasmaPenerimaSignUp4(state.pengguna, state.penerima);
        } else if (state is OnPlasmaPenerimaSignUp5) {
          return PlasmaPenerimaSignUp5(state.pengguna, state.penerima);
        } else if (state is OnPlasmaPendonorSignUp1) {
          return PlasmaPendonorSignUp1(state.pengguna, state.penerima);
        } else if (state is OnPlasmaPendonorSignUp2) {
          return PlasmaPendonorSignUp2(state.pengguna, state.penerima);
        } else if (state is OnPlasmaPendonorSignUp3) {
          return PlasmaPendonorSignUp3(state.pengguna, state.penerima);
        } else if (state is OnPlasmaPendonorSignUp4) {
          return PlasmaPendonorSignUp4(state.pengguna, state.penerima);
        } else if (state is OnPlasmaPendonorSignUp5) {
          return PlasmaPendonorSignUp5(state.pengguna, state.penerima);
        } else if (state is OnPlasmaPage) {
          return PlasmaPage(state.pengguna);
        } else if (state is OnPlasmaDetailPenerima) {
          return PlasmaDetailPenerima(state.pengguna, state.penerimaDonor);
        } else if (state is OnPlasmaDetailPendonor) {
          return PlasmaDetailPendonor(state.pengguna, state.penerima);
          // return RecoveryDetailPage(state.calendar, state.recovery);
        } else if (state is OnListProvinsi) {
          return ListProvinsiPage();
        } else {
          return Container();
        }
      },
    );
  }
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }

  // Or do other work.
}
