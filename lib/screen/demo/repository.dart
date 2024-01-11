import 'package:verifik/models/document.dart';
import 'package:verifik/screen/demo/bloc/bloc.dart';
import 'package:verifik/utils/http/http_client.dart';

class Repository {
  Repository({
    required this.xigoHttpClient,
  });

  final XigoHttpClient xigoHttpClient;

  final scanDemo = '/v2/ocr/scan-demo';
  final compareRecognition = '/v2/face-recognition/compare/demo';

  Future<DocumentDetails> getDetails(String image) async {
    final response = await xigoHttpClient.msDio.post(
      scanDemo,
      data: {
        'image': image,
      },
    );

    return DocumentDetails.fromJson(response.data);
  }

  Future<DocumentDetails> getCompareRecognition({
    required String probe,
    required String gallery,
  }) async {
    final response = await xigoHttpClient.msDio.post(
      compareRecognition,
      data: {
        'probe': probe,
        'gallery': gallery,
        'search_mode': 'FAST',
      },
    );

    return DocumentDetails.fromJson(response.data);
  }
}
