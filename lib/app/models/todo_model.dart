class Todo{
  int?userid;
  int?id;
  String?title;
  bool?completed;

  Todo({this.userid, this.id, this.title, this.completed});

  factory Todo.fromJson(Map<String,dynamic>json)=>Todo(
    userid: json['userId'],
    id: json['id'],
    title: json['title'],
    completed: json['completed']
  );
}