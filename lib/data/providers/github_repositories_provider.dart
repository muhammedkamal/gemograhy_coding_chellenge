import 'dart:convert';

import 'package:gemo_coding_ch/logic/exceptions/http_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/repository_model.dart';

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
        pageNaumber++;
        for (var item in responseReposList) {
          _repos.add(Repository.fromJson(item));
        }
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        throw HttpExceptions(
            message:
                "We are facing some error please try again in few moments");
      } else if (response.statusCode >= 500) {
        throw HttpExceptions(
            message:
                "The Server are facing some error please try again in few moments");
      }
    } catch (e) {
      throw e;
    }
  }

  List<Repository> get repositories {
    return _repos;
  }
}
