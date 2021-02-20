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
    if (user == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        pageBloc.add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToHomePage)) {
        prevPageEvent = GoToHomePage();
        userBloc.add(LoadUser(user.email));
        pageBloc.add(prevPageEvent);
      }
    }
    // if (user == null) {
    //   pageBloc.add(GoToLoginPage());
    // pageBloc.add(GoToCalendarSignUpPage1());
    // pageBloc.add(GoToCalendarOnboardPage());
    // pageBloc.add(GoToAddCommentPage("Reply to Muhammad Erlangga",
    //     "\"Tata Cara Mencuci Hidung yang Benar\"", true));
    // pageBloc.add(GoToDetailInfoPage());
    // pageBloc.add(GoToInfoPage());
    // pageBloc.add(GoToHomePage());
    // pageBloc.add(GoToProfilePage());
    // pageBloc.add(GoToOnboardPage());
    // pageBloc.add(GoToSplashPage());
    // } else {
    //   userBloc.add(LoadUser(user.uid));
    //   pageBloc.add(GoToHomePage());
    // }
    return BlocBuilder<PageBloc, PageState>(
      builder: (context, state) {
        if (state is OnSplashPage) {
          return SplashPage();
          // return SignupPage();
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
