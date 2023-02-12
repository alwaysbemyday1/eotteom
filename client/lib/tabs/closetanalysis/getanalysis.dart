import "dart:convert";
import "package:http/http.dart" as http;

Future<Map<String, dynamic>> requestGetApi(
    String userId, String tokenAccess) async {
  // Request GET api
  String url = 'http://127.0.0.1:8000/api/clothes/stats/${userId}/';
  http.Response response = await http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${tokenAccess}',
  });

  // Parse response body
  var jsonBody = json.decode(response.body);

  // Return json body
  return jsonBody;
}

Map<String, double> getpiechartMap(List categoryCount) {
  Map<String, double> piechartmap = {};
  for (Map v in categoryCount) {
    piechartmap[v['major_category']] = v['count'].toDouble();
  }
  return piechartmap;
}

List<int> getCount(List categoryCount) {
  List<int> counts = [];
  for(Map v in categoryCount) {
    counts.add(v['count']!);
  }
  return counts;
}

List _sortList(List data) {
    data.sort((b, a) => a['count'].compareTo(b['count']));
    return data;
  }

num totalCountColor(List colorCount) {
  num total = 0;
  for(Map v in colorCount) {
    total += v['count']!;
  }
  return total;
}