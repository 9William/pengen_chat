import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/common/config/supabase.dart';
import 'package:pengen_chat/home/view/home_view.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.instance.initialization();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pengen Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeView(),
    );
  }
}
