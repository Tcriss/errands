import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
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

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Errands',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const LoginView(),
        '/sing-up': (context) => const SingupView(),
      },
    );
  }
}
