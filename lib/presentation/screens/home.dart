import 'package:flutter/material.dart';
import '../../data/models/repository_model.dart';
import '../../data/providers/github_repositories_provider.dart';
import '../widgets/repo_tile_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RepositoriesProvider repositoriesProvider = RepositoriesProvider();
  List<Repository> repos = [];
  bool isLoading = true;
  @override
  void didChangeDependencies() async {
    if (isLoading) {
      try {
        await repositoriesProvider.fetchRepositoriesData();
      } catch (e) {
        print(e);
      }
      setState(() {
        repos = repositoriesProvider.repositories;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .4,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  Image.asset("assets/images/logo.png"),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Github Most Stared Repositories Last Month",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        return RepoTile(
                          repoName: repos[index].name,
                          repoDiscription: repos[index].description != null
                              ? repos[index].description!
                              : "No descripton",
                          userName: repos[index].userName,
                          userAvatarUrl: repos[index].userAvatarUrl,
                          noOfStars: repos[index].noOfStarts.toString(),
                        );
                      },
                      itemCount: repos.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
