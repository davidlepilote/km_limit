import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/router.dart';
import 'ui/service/service.dart';
import 'ui/themes.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppTheme(
      child: MaterialApp(
        onGenerateRoute: Router.generateRoute,
        home: Service(),
      ),
    );
  }
}

