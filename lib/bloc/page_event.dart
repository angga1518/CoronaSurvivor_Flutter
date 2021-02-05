part of 'page_bloc.dart';

@immutable
abstract class PageEvent {}


class GoToSplashPage extends PageEvent {}

class GoToMainPage extends PageEvent {}