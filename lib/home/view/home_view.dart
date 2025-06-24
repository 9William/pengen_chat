import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/common/utils/date_utils.dart';
import 'package:pengen_chat/home/controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Threads")),
      body: Obx(() {
        final threads = homeController.threads;

        if (threads.isEmpty) {
          return const Center(child: Text("Belum ada thread bro 😴"));
        }

        return ListView.builder(
          itemCount: threads.length,
          itemBuilder: (context, index) {
            final thread = threads[index];
            return ListTile(
              title: Text(thread.title ?? ""),
              subtitle: Text(
                DateUtil.timeAgoFromString(thread.createdAt ?? ""),
              ),
            );
          },
        );
      }),
    );
  }
}
