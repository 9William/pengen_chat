import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/home/controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return const Placeholder();
  }
}
