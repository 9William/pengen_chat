import 'package:get/get.dart';
import 'package:pengen_chat/common/config/supabase.dart';
import '../models/thread_model.dart';

class HomeController extends GetxController {
  var threads = <ThreadModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    listenToThreadStream();
  }

  void listenToThreadStream() {
    SupabaseConfig.instance.supabaseClient
        .from('threads')
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: false)
        .map((data) => data
            .map((e) => ThreadModel.fromJson(e))
            .toList())
        .listen((newList) {
          threads.value = newList;
        });
  }
}
