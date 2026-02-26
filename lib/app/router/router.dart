import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import '../screen/home/home_screen.dart';
import '../screen/home/home_screen.dart';

abstract class Routers {
  static final router = GoRouter(
    observers: [
      BotToastNavigatorObserver(), // これが必要
      FlutterSmartDialog.observer, // これが必要
    ],
    routes: [GoRoute(path: '/', builder: (context, state) => HomeScreen())],
  );
}
