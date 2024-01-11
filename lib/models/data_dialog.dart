import 'dart:typed_data';

import 'package:verifik/models/document.dart';

class DataDialog {
  const DataDialog({
    required this.documentDetails,
    required this.imageMemory,
  });

  final DocumentDetails documentDetails;
  final Uint8List imageMemory;
}
