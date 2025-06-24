import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static final instance = SupabaseConfig();

  late SupabaseClient supabaseClient = Supabase.instance.client;

  Future initialization() async {
    await Supabase.initialize(
      url: 'https://hyiyoxagxpanbpwfvhwj.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh5aXlveGFneHBhbmJwd2Z2aHdqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA2NzA5MjUsImV4cCI6MjA2NjI0NjkyNX0.DlLd9iiY0BPiL3rfZj4fyQHtQvJRWhoSKlSd9AJ2j2E',
    );
  }
}
