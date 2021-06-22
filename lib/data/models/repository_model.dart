class Repository {
  String name, userName, userAvatarUrl;
  String? description;
  int noOfStarts;
  Repository({
    required this.description,
    required this.name,
    required this.noOfStarts,
    required this.userAvatarUrl,
    required this.userName,
  });
  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      description: json['description'],
      name: json['name'],
      userAvatarUrl: json['owner']['avatar_url'],
      userName: json['owner']['login'],
      noOfStarts: json['stargazers_count'],
    );
  }
}
