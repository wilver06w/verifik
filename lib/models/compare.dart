class Compare {
  Data data;

  Compare({
    required this.data,
  });

  factory Compare.fromJson(Map<String, dynamic> json) => Compare(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<String> gallery;
  List<String> probe;
  String id;
  bool deleted;
  String searchMode;
  String client;
  String type;
  DateTime comparedAt;
  Result result;
  DateTime updatedAt;
  DateTime createdAt;

  Data({
    this.gallery = const [],
    this.probe = const [],
    required this.id,
    required this.deleted,
    required this.searchMode,
    required this.client,
    required this.type,
    required this.comparedAt,
    required this.result,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        gallery: List<String>.from(json["gallery"].map((x) => x)),
        probe: List<String>.from(json["probe"].map((x) => x)),
        id: json["_id"] ?? '',
        deleted: json["deleted"] ?? false,
        searchMode: json["search_mode"] ?? '',
        client: json["client"] ?? '',
        type: json["type"] ?? '',
        comparedAt: DateTime.parse(json["comparedAt"]),
        result: Result.fromJson(json["result"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
        "probe": List<dynamic>.from(probe.map((x) => x)),
        "_id": id,
        "deleted": deleted,
        "search_mode": searchMode,
        "client": client,
        "type": type,
        "comparedAt": comparedAt.toIso8601String(),
        "result": result.toJson(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}

class Result {
  double score;

  Result({
    this.score = 0.0,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        score: json["score"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "score": score,
      };
}
