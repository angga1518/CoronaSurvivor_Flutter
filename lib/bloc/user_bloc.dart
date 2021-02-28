import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:corona_survivor_flutter/models/models.dart';
import 'package:corona_survivor_flutter/services/services.dart';
import 'package:corona_survivor_flutter/shared/shared.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      Pengguna pengguna = await PenggunaServices.getPengguna(event.email);
      listSharedSavedArtikel =
          await ArtikelServices.getAllSavedArtikel(pengguna.email);
      listSharedAllArtikel =
          await ArtikelServices.getAllArtikel(pengguna.email);
      yield UserLoaded(pengguna);
    } else if (event is SignOut) {
      yield UserInitial();
    }
  }
}
