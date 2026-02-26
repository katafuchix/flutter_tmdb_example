import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../core/util/network_cubit.dart';
import 'injection.dart';
import 'router/router.dart';
import 'util/bloc_providers.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: buildListProviders(locator: locator),
      child: BlocListener<NetworkCubit, NetworkState>(
        listenWhen: (previous, current) =>
            previous.isOnline && current.isOffline,
        listener: (context, state) {
          // オンラインからオフラインに切り替わった「瞬間」だけ呼ばれる
          //showNetWorkErrorSnackBar(context);
        },
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          routerConfig: Routers.router,
          // アプリ全体の描画空間をカスタマイズする場所
          builder: (context, child) {
            // 1. まず BotToast でラップする
            final botToastBuilder = BotToastInit();
            child = botToastBuilder(context, child);

            // 2. 次に SmartDialog でラップする
            final smartDialogBuilder = FlutterSmartDialog.init();
            child = smartDialogBuilder(context, child);

            return child;
          },
        ),
      ),
    );
  }
}
