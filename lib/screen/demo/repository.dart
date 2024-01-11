import 'package:verifik/models/document.dart';
import 'package:verifik/utils/http/http_client.dart';

class Repository {
  Repository({
    required this.xigoHttpClient,
  });

  final XigoHttpClient xigoHttpClient;

  final scanDemo = '/v2/ocr/scan-demo';

  Future<DocumentDetails> getDetails(String image) async {
    final response = await xigoHttpClient.msDio.post(
      scanDemo,
      data: {
        'image': image,
      },
    );

    return DocumentDetails.fromJson(response.data);
  }
}
