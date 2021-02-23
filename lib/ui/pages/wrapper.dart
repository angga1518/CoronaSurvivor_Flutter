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

        setState(() {
          messageTitle = message["notification"]["title"];
          notificationAlert = token;
        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        setState(() {
          messageTitle = message["notification"]["title"];
          notificationAlert = "New Notification Alert";
        });
      },
      onResume: (message) async {
        print("onResume: $message");
        setState(() {
          messageTitle = message["data"]["title"];
          notificationAlert = "Application opened from Notification";
        });
      },
    );
  }

  Future<void> _checkNewToken() async {
    // hit api cek access token yang lama
    // bandingin
    // kalo beda hit beda api ke backend
    token = await _firebaseMessaging.getToken();
    print("token nih: " + token);
  }

  @override
  Widget build(BuildContext context) {
    UIHelper(context);
    User user = Provider.of<User>(context);
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    pageBloc.add(GoToRecoveryOnBoardPage());
    // if (user == null) {
    //   // for dev
    //   // pageBloc.add(GoToCalendarSignUpPage1());
    //   if (!(prevPageEvent is GoToSplashPage)) {
    //     prevPageEvent = GoToSplashPage();
    //     pageBloc.add(prevPageEvent);
    //   }
    // } else {
    //   if (prevPageEvent is GoToOnboardPage) {
    //     prevPageEvent = GoToHomePage();
    //     userBloc.add(LoadUser(user.email));
    //     pageBloc.add(GoToOnboardPage());
    //   }
    //   if (!(prevPageEvent is GoToHomePage)) {
    //     prevPageEvent = GoToHomePage();
    //     userBloc.add(LoadUser(user.email));
    //     pageBloc.add(prevPageEvent);
    //   }
    // }
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
          return ProfilePage();
        } else if (state is OnDonorGiverPage) {
          return DonorGiverPage();
        } else if (state is OnDonorReceiverPage) {
          return DonorReceiverPage();
        } else if (state is OnInfoPage) {
          return InfoPage();
        } else if (state is OnDetailInfoPage) {
          return DetailInfo();
        } else if (state is OnAddCommentPage) {
          return AddCommentPage(state.title, state.component, state.isReply);
        } else if (state is OnCalendarOnboardPage) {
          return CalendarOnboardPage();
        } else if (state is OnCalendarSignUpPage1) {
          return CalendarSignUpPage1();
        } else if (state is OnCalendarSignUpPage2) {
          return CalendarSignUpPage2();
        } else if (state is OnCalendarSignUpPage3) {
          return CalendarSignUpPage3();
        } else if (state is OnCalendarSignUpPage4) {
          return CalendarSignUpPage4();
        } else if (state is OnCalendarSignUpPage5) {
          return CalendarSignUpPage5();
        } else if (state is OnCalendarHome) {
          return CalendarHomePage();
        } else if (state is OnConnectPuskesmasPage) {
          return ConnectPuskesPage();
        } else if (state is OnSuccessPage) {
          return SuccessPage(
              state.message, state.goTo, state.backTo, state.pinkButtonMessage);
        } else if (state is OnRecoveryOnBoardPage) {
          return RecoveryOnboardPage();
        } else if (state is OnAddRecoveryPage) {
          return AddRecoveryPage();
        } else if (state is OnAddNewGejalaPage) {
          return AddNewGejalaPage();
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
