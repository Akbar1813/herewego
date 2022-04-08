class Post {
  String? userId;
  String? firstName;
  String? lastName;
  String? content;
  String? date;

  Post(this.userId,this.firstName,this.lastName, this.content, this.date,);
  Post.fromJson(Map<String, dynamic> json)
  : userId = json['userId'],
    firstName = json['firstName'],
    lastName = json['lastName'],
    date = json['date'],
    content = json['content'];

  Map<String, dynamic> toJson() => {
    'userId' : userId,
    'firstName' : firstName,
    'lastName' : lastName,
    'date' : date,
    'content' : content
  };
}