class Repository {
  String name, description, userName, userAvatarUrl;
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
      name: json['jd_scripts'],
      userAvatarUrl: json['owner']['avatar_url'],
      userName: json['owner']['login'],
      noOfStarts: json['stargazers_count'],
    );
  }
}
