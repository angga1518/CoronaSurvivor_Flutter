part of 'page_bloc.dart';

@immutable
abstract class PageEvent {}

class GoToSplashPage extends PageEvent {}

class GoToLoginPage extends PageEvent {}

class GotoSignupPage extends PageEvent {}

class GoToHomePage extends PageEvent {}

class GoToOnboardPage extends PageEvent {}

class GoToProfilePage extends PageEvent {}

class GoToDonorGiverPage extends PageEvent {}

class GoToDonorReceiverPage extends PageEvent {}
