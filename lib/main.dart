import 'package:errands/tasks/presentation/providers/task-provider.dart';
import 'package:errands/tasks/presentation/views/task-list-view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:errands/core/app/env.dart';
import 'package:errands/core/services/service_locator.dart';
import 'package:errands/auth/presentation/views/views.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Env.sbUrl,
    anonKey: Env.sbAnnonKey,
    realtimeClientOptions: const RealtimeClientOptions(
      logLevel: kDebugMode ? RealtimeLogLevel.debug : RealtimeLogLevel.info,
    ),
  );
  await setupServiceLocator();
  MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => TaskProvider())
  ]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'Errands',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const TaskListView(),
        '/login': (context) => const LoginView(),
        '/sing-up': (context) => const SingupView(),
      },
    );
  }
}
