part of 'page_bloc.dart';

@immutable
abstract class PageEvent {}

class GoToSplashPage extends PageEvent {}

class GoToLoginPage extends PageEvent {}

class GoToSignupPage extends PageEvent {}

class GoToHomePage extends PageEvent {}

class GoToOnboardPage extends PageEvent {}

class GoToProfilePage extends PageEvent {}

class GoToDonorGiverPage extends PageEvent {}

class GoToDonorReceiverPage extends PageEvent {}

class GoToInfoPage extends PageEvent {}

class GoToDetailInfoPage extends PageEvent {}

class GoToAddCommentPage extends PageEvent {
  final String title;
  final String component;
  final bool isReply;

  GoToAddCommentPage(this.title, this.component, this.isReply);
}

class GoToCalendarOnboardPage extends PageEvent {}

class GoToCalendarSignUpPage1 extends PageEvent {}

class GoToCalendarSignUpPage2 extends PageEvent {}

class GoToCalendarSignUpPage3 extends PageEvent {}

class GoToCalendarSignUpPage4 extends PageEvent {}

class GoToCalendarSignUpPage5 extends PageEvent {}

class GoToCalendarHome extends PageEvent {}

class GoToConnectPuskesmasPage extends PageEvent {}

class GoToSuccessPage extends PageEvent {}