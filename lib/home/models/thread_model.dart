class ThreadModel {
  final String id;
  final String title;
  final int created_at;
  final String user_id;
  final int like_count;

  ThreadModel({
    required this.id,
    required this.title,
    required this.user_id,
    required this.created_at,
    required this.like_count,
  });

  factory ThreadModel.fromMap(Map<String, dynamic> map) {
    return ThreadModel(
      id: map['id'],
      title: map['title'],
      user_id: map['user_id'],
      created_at: map['created_at'],
      like_count: map['like_count'],
    );
  }
}
