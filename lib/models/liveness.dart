class Liveness {
  Data data;

  Liveness({
    required this.data,
  });

  factory Liveness.fromJson(Map<String, dynamic> json) => Liveness(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  String status;
  String searchMode;
  List<String> images;
  String id;
  bool deleted;
  String client;
  String type;
  String os;
  double livenessMinScore;
  Result result;
  DateTime updatedAt;
  DateTime createdAt;

  Data({
    required this.status,
    required this.searchMode,
    required this.images,
    required this.id,
    required this.deleted,
    required this.client,
    required this.type,
    required this.os,
    this.livenessMinScore = 0.0,
    required this.result,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"] ?? '',
        searchMode: json["search_mode"] ?? '',
        images: List<String>.from(json["images"].map((x) => x)),
        id: json["_id"] ?? '',
        deleted: json["deleted"] ?? false,
        client: json["client"] ?? '',
        type: json["type"] ?? '',
        os: json["os"] ?? '',
        livenessMinScore: json["liveness_min_score"]?.toDouble(),
        result: Result.fromJson(json["result"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "search_mode": searchMode,
        "images": List<dynamic>.from(images.map((x) => x)),
        "_id": id,
        "deleted": deleted,
        "client": client,
        "type": type,
        "os": os,
        "liveness_min_score": livenessMinScore,
        "result": result.toJson(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}

class Result {
  double livenessScore;
  bool passed;
  double minScore;

  Result({
    this.livenessScore = 0.0,
    this.passed = false,
    this.minScore = 0.0,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        livenessScore: json["liveness_score"]?.toDouble(),
        passed: json["passed"] ?? false,
        minScore: json["min_score"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "liveness_score": livenessScore,
        "passed": passed,
        "min_score": minScore,
      };
}
