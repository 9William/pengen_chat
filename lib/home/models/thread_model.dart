class ThreadModel {
  String? createdAt;
  String? id;
  int? likeCount;
  String? title;
  String? userId;

 ThreadModel(
      {this.createdAt, this.id, this.likeCount, this.title, this.userId});

 ThreadModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    id = json['id'];
    likeCount = json['like_count'];
    title = json['title'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['like_count'] = this.likeCount;
    data['title'] = this.title;
    data['user_id'] = this.userId;
    return data;
  }
}
