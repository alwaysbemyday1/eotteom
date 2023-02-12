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


void main() async {
  String userId = "814e69d9-145c-4ffb-8703-771525a011e2";
  String tokenAccess = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc3MDUyMzAxLCJpYXQiOjE2NzYxODgzMDEsImp0aSI6IjhkMDRmZmVkMmVhZTQ0Yzg4ZWU0ZWZmM2ZjZDQ0ZTA0IiwidXNlcl9pZCI6IjgxNGU2OWQ5LTE0NWMtNGZmYi04NzAzLTc3MTUyNWEwMTFlMiJ9.-Q6_I2yBUYnd9j9nSBVzNXmTiBHGEt6r-JEpVyDSR2I";

  var jb = await requestGetApi(userId, tokenAccess);
  print(jb['category_count']);
}
