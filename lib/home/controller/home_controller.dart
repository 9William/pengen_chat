import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/thread_model.dart';

class HomeController extends GetxController {
  late SupabaseClient supabase;

  var threads = <ThreadModel>[].obs;
  late RealtimeChannel channel;

  @override
  Future<void> onInit() async {
    super.onInit();

    await Supabase.initialize(
      url: 'https://hyiyoxagxpanbpwfvhwj.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh5aXlveGFneHBhbmJwd2Z2aHdqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA2NzA5MjUsImV4cCI6MjA2NjI0NjkyNX0.DlLd9iiY0BPiL3rfZj4fyQHtQvJRWhoSKlSd9AJ2j2E',
    );
    supabase = Supabase.instance.client;

    fetchThreads();
    setupRealtime();
  }

  void fetchThreads() async {
    final res = await supabase
        .from('threads')
        .select('id, title, like_count')
        .order('created_at', ascending: false);

    threads.value = (res as List)
        .map((e) => ThreadModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  void setupRealtime() {
    print("haloo");
    supabase.from('threads').stream(primaryKey: ['id']).listen((
      List<Map<String, dynamic>> data,
    ) {
      print("Keluar data $data");
    });
  }

  @override
  void onClose() {
    supabase.removeChannel(channel);
    super.onClose();
  }
}
