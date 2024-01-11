class DocumentDetails {
  Data data;

  DocumentDetails({
    required this.data,
  });

  factory DocumentDetails.fromJson(Map<String, dynamic> json) =>
      DocumentDetails(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  DocumentType documentType;
  dynamic pro;
  Prompt prompt;
  Studio studio;

  Data({
    required this.documentType,
    required this.pro,
    required this.prompt,
    required this.studio,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        documentType: DocumentType.fromJson(json["documentType"]),
        pro: json["pro"],
        prompt: Prompt.fromJson(json["prompt"]),
        studio: Studio.fromJson(json["studio"]),
      );

  Map<String, dynamic> toJson() => {
        "documentType": documentType.toJson(),
        "pro": pro,
        "prompt": prompt.toJson(),
        "studio": studio.toJson(),
      };
}

class DocumentType {
  String documentType;
  String category;
  String country;
  String ocrRaw;
  String prompt;

  DocumentType({
    required this.documentType,
    required this.category,
    required this.country,
    required this.ocrRaw,
    required this.prompt,
  });

  factory DocumentType.fromJson(Map<String, dynamic> json) => DocumentType(
        documentType: json["documentType"],
        category: json["category"],
        country: json["country"],
        ocrRaw: json["ocrRaw"],
        prompt: json["prompt"],
      );

  Map<String, dynamic> toJson() => {
        "documentType": documentType,
        "category": category,
        "country": country,
        "ocrRaw": ocrRaw,
        "prompt": prompt,
      };
}

class Prompt {
  String documentType;
  String status;
  bool imageValidated;
  String validationMethod;
  String type;
  String id;
  bool deleted;
  String documentNumber;
  String url;
  PromptOcrExtraction ocrExtraction;
  DateTime updatedAt;
  DateTime createdAt;
  int v;

  Prompt({
    required this.documentType,
    required this.status,
    required this.imageValidated,
    required this.validationMethod,
    required this.type,
    required this.id,
    required this.deleted,
    required this.documentNumber,
    required this.url,
    required this.ocrExtraction,
    required this.updatedAt,
    required this.createdAt,
    required this.v,
  });

  factory Prompt.fromJson(Map<String, dynamic> json) => Prompt(
        documentType: json["documentType"],
        status: json["status"],
        imageValidated: json["imageValidated"],
        validationMethod: json["validationMethod"],
        type: json["type"],
        id: json["_id"],
        deleted: json["deleted"],
        documentNumber: json["documentNumber"],
        url: json["url"],
        ocrExtraction: PromptOcrExtraction.fromJson(json["OCRExtraction"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "documentType": documentType,
        "status": status,
        "imageValidated": imageValidated,
        "validationMethod": validationMethod,
        "type": type,
        "_id": id,
        "deleted": deleted,
        "documentNumber": documentNumber,
        "url": url,
        "OCRExtraction": ocrExtraction.toJson(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
      };
}

class PromptOcrExtraction {
  String firstName;
  String lastName;
  String fullName;
  String documentNumber;

  PromptOcrExtraction({
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.documentNumber,
  });

  factory PromptOcrExtraction.fromJson(Map<String, dynamic> json) =>
      PromptOcrExtraction(
        firstName: json["firstName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        documentNumber: json["documentNumber"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "documentNumber": documentNumber,
      };
}

class Studio {
  String documentType;
  String status;
  bool imageValidated;
  String validationMethod;
  String type;
  String id;
  bool deleted;
  String documentNumber;
  String url;
  StudioOcrExtraction ocrExtraction;
  DateTime updatedAt;
  DateTime createdAt;
  int v;

  Studio({
    required this.documentType,
    required this.status,
    required this.imageValidated,
    required this.validationMethod,
    required this.type,
    required this.id,
    required this.deleted,
    required this.documentNumber,
    required this.url,
    required this.ocrExtraction,
    required this.updatedAt,
    required this.createdAt,
    required this.v,
  });

  factory Studio.fromJson(Map<String, dynamic> json) => Studio(
        documentType: json["documentType"],
        status: json["status"],
        imageValidated: json["imageValidated"],
        validationMethod: json["validationMethod"],
        type: json["type"],
        id: json["_id"],
        deleted: json["deleted"],
        documentNumber: json["documentNumber"],
        url: json["url"],
        ocrExtraction: StudioOcrExtraction.fromJson(json["OCRExtraction"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "documentType": documentType,
        "status": status,
        "imageValidated": imageValidated,
        "validationMethod": validationMethod,
        "type": type,
        "_id": id,
        "deleted": deleted,
        "documentNumber": documentNumber,
        "url": url,
        "OCRExtraction": ocrExtraction.toJson(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
      };
}

class StudioOcrExtraction {
  Details details;
  String firstName;
  String documentNumber;

  StudioOcrExtraction({
    required this.details,
    required this.firstName,
    required this.documentNumber,
  });

  factory StudioOcrExtraction.fromJson(Map<String, dynamic> json) =>
      StudioOcrExtraction(
        details: Details.fromJson(json["details"]),
        firstName: json["firstName"],
        documentNumber: json["documentNumber"],
      );

  Map<String, dynamic> toJson() => {
        "details": details.toJson(),
        "firstName": firstName,
        "documentNumber": documentNumber,
      };
}

class Details {
  String docType;
  List<BoundingRegion> boundingRegions;
  List<Span> spans;
  Fields fields;
  double confidence;

  Details({
    required this.docType,
    required this.boundingRegions,
    required this.spans,
    required this.fields,
    required this.confidence,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        docType: json["docType"],
        boundingRegions: List<BoundingRegion>.from(
            json["boundingRegions"].map((x) => BoundingRegion.fromJson(x))),
        spans: List<Span>.from(json["spans"].map((x) => Span.fromJson(x))),
        fields: Fields.fromJson(json["fields"]),
        confidence: json["confidence"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "docType": docType,
        "boundingRegions":
            List<dynamic>.from(boundingRegions.map((x) => x.toJson())),
        "spans": List<dynamic>.from(spans.map((x) => x.toJson())),
        "fields": fields.toJson(),
        "confidence": confidence,
      };
}

class BoundingRegion {
  int pageNumber;
  List<Polygon> polygon;

  BoundingRegion({
    required this.pageNumber,
    required this.polygon,
  });

  factory BoundingRegion.fromJson(Map<String, dynamic> json) => BoundingRegion(
        pageNumber: json["pageNumber"],
        polygon:
            List<Polygon>.from(json["polygon"].map((x) => Polygon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageNumber": pageNumber,
        "polygon": List<dynamic>.from(polygon.map((x) => x.toJson())),
      };
}

class Polygon {
  int x;
  int y;

  Polygon({
    required this.x,
    required this.y,
  });

  factory Polygon.fromJson(Map<String, dynamic> json) => Polygon(
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}

class Fields {
  DocumentNumber firstName;
  DocumentNumber documentNumber;
  LastName lastName;

  Fields({
    required this.firstName,
    required this.documentNumber,
    required this.lastName,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        firstName: DocumentNumber.fromJson(json["firstName"]),
        documentNumber: DocumentNumber.fromJson(json["documentNumber"]),
        lastName: LastName.fromJson(json["lastName"]),
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName.toJson(),
        "documentNumber": documentNumber.toJson(),
        "lastName": lastName.toJson(),
      };
}

class DocumentNumber {
  String kind;
  String value;
  List<BoundingRegion> boundingRegions;
  String content;
  List<Span> spans;
  double confidence;

  DocumentNumber({
    required this.kind,
    required this.value,
    required this.boundingRegions,
    required this.content,
    required this.spans,
    required this.confidence,
  });

  factory DocumentNumber.fromJson(Map<String, dynamic> json) => DocumentNumber(
        kind: json["kind"],
        value: json["value"],
        boundingRegions: List<BoundingRegion>.from(
            json["boundingRegions"].map((x) => BoundingRegion.fromJson(x))),
        content: json["content"],
        spans: List<Span>.from(json["spans"].map((x) => Span.fromJson(x))),
        confidence: json["confidence"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "value": value,
        "boundingRegions":
            List<dynamic>.from(boundingRegions.map((x) => x.toJson())),
        "content": content,
        "spans": List<dynamic>.from(spans.map((x) => x.toJson())),
        "confidence": confidence,
      };
}

class Span {
  int offset;
  int length;

  Span({
    required this.offset,
    required this.length,
  });

  factory Span.fromJson(Map<String, dynamic> json) => Span(
        offset: json["offset"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "length": length,
      };
}

class LastName {
  String kind;
  double confidence;

  LastName({
    required this.kind,
    required this.confidence,
  });

  factory LastName.fromJson(Map<String, dynamic> json) => LastName(
        kind: json["kind"],
        confidence: json["confidence"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "confidence": confidence,
      };
}
