part of 'page_bloc.dart';

@immutable
abstract class PageEvent {}


class GoToSplashPage extends PageEvent {}

class GoToMainPage extends PageEvent {}

class GoToLoginPage extends PageEvent{}

class GoToHomePage extends PageEvent {}
