class OutfitModel {
  final int count;
  final List<dynamic> results;
  OutfitModel(
      {
        required this.count,
        required this.results
      });

  factory OutfitModel.fromJson(Map<String, dynamic> json) {
    return OutfitModel(
        count: json["count"],
        results : json["results"]
        );
  }

  Map<String, dynamic> toJson() {
    return {
      "count" : count,
      "results" : results
    };
  }
}
