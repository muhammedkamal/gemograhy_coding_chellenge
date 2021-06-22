import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'repository_model.dart';

class RepositoriesProvider {
  int pageNaumber = 1;
  List<Repository> _repos = [];
  String date = DateFormat("yyyy-MM-dd")
      .format(DateTime.now().subtract(Duration(days: 30)));
  Future<void> fetchRepositoriesData() async {
    var url = Uri.parse(
        "https://api.github.com/search/repositories?q=created:>$date&sort=stars&order=desc&page=$pageNaumber");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> responseReposList = jsonDecode(response.body)['items'];
        print(responseReposList.length);
        pageNaumber++;
        for (var item in responseReposList) {
          _repos.add(Repository.fromJson(item));
          print(_repos.last.name);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
