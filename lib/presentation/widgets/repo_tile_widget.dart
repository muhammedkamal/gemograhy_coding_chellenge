import 'package:flutter/material.dart';

class RepoTile extends StatelessWidget {
  final String repoName, repoDiscription, userName, noOfStars, userAvatarUrl;

  const RepoTile(
      {Key? key,
      required this.repoName,
      required this.repoDiscription,
      required this.userName,
      required this.noOfStars,
      required this.userAvatarUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ListTile(
                leading: SizedBox(
                  height: 70,
                  width: 70,
                  child: FittedBox(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(userAvatarUrl),
                        ),
                        Text(userName),
                      ],
                    ),
                  ),
                ),
                title: Text(repoName),
                subtitle: Text(repoDiscription),
                trailing: Column(
                  children: [
                    Icon(Icons.star),
                    Text(
                      noOfStars,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
