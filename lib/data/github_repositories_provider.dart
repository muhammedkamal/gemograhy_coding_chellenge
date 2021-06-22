import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class RepositoriedProvider {
  int pageNaumber = 1;
  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
  fetchRepositoriesData() {}
}
