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
    User user = Provider.of<User>(context);
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    if (user == null) {
      pageBloc.add(GoToSplashPage());
    } else {
      userBloc.add(LoadUser(user.uid));
      pageBloc.add(GoToMainPage());
    }
    return BlocBuilder<PageBloc, PageState>(
      builder: (context, state) {
        if (state is OnSplashPage) {
          return SplashPage();
        } else {
          return MainPage();
        }
      },
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("test"),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Text(
    //           token,
    //         ),
    //         Text(
    //           messageTitle,
    //           style: Theme.of(context).textTheme.headline4,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
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
