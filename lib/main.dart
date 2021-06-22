import 'package:flutter/material.dart';

import 'data/github_repositories_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Most Stared',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RepositoriesProvider repositoriesProvider = RepositoriesProvider();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text("fetch data"),
          onPressed: () async {
            await repositoriesProvider.fetchRepositoriesData();
          },
        ),
      ),
    );
  }
}
