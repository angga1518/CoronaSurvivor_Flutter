import 'package:corona_survivor_flutter/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/blocs.dart';
import 'ui/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: AuthServices.userStream,
        child: MultiBlocProvider(
            providers: [
              BlocProvider<PageBloc>(
                create: (context) => PageBloc(),
              ),
              BlocProvider<ThemeBloc>(
                create: (context) => ThemeBloc(),
              ),
              BlocProvider<UserBloc>(
                create: (context) => UserBloc(),
              ),
            ],
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return MaterialApp(
                  title: 'Corona Survivor',
                  theme: state.themeData,
                  home: Wrapper(),
                );
              },
            )));
  }
}
