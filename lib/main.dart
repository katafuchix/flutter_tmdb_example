import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // これを呼ぶだけで、@injectable をつけたクラスがすべて locator に登録されます
  await configureDependencies();
  runApp(const MyApp());
}
