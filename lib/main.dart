import 'package:errands/auth/presentation/views/login_view.dart';
import 'package:errands/core/application/env.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: Env.sbUrl,
    anonKey: Env.sbAnnonKey
  );
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Errands',
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: const LoginView()),
    );
  }
}
