import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import '../model/movie.dart';
import '../screen/detail/detail_screen.dart';
import '../screen/home/home_screen.dart';

abstract class Routers {
  static final router = GoRouter(
    observers: [
      BotToastNavigatorObserver(),
      FlutterSmartDialog.observer,
    ],
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomeScreen()),
      GoRoute(path: '/detail', builder: (context, state) {
        final movie = state.extra as Movie;
        return DetailScreen(movie: movie,);
      })],
  );
}
