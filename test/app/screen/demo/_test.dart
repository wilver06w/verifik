import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:verifik/app/models/document.dart';
import 'package:verifik/app/screen/demo/bloc/bloc.dart';
import 'package:verifik/app/screen/demo/repository.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final updateAt = DateTime.now();
  DocumentDetails documentDetails = DocumentDetails(
    data: Data(
      documentType: DocumentType(
        documentType: 'CC',
        category: '',
        country: '',
        ocrRaw: '',
        prompt: '',
      ),
      pro: false,
      prompt: Prompt(
        ocrExtraction: PromptOcrExtraction(
          firstName: 'Wilver',
          lastName: 'Rojas',
          fullName: 'Wilver Rojas',
          documentNumber: '1111',
        ),
        updatedAt: updateAt,
        createdAt: updateAt,
      ),
      studio: Studio(
        documentType: '123',
        status: '',
        imageValidated: false,
        validationMethod: '',
        type: '',
        id: '',
        deleted: false,
        documentNumber: '',
        url: '',
        ocrExtraction: StudioOcrExtraction(
          details: Details(
            docType: '',
            boundingRegions: [],
            spans: [],
            fields: Fields(
              firstName: DocumentNumber(
                kind: '',
                value: '',
                boundingRegions: [],
                content: '',
                spans: [],
                confidence: 0.0,
              ),
              documentNumber: DocumentNumber(
                kind: '',
                value: '',
                boundingRegions: [],
                content: '',
                spans: [],
                confidence: 0.0,
              ),
              lastName: LastName(
                kind: '',
                confidence: 0.0,
              ),
            ),
            confidence: 0.0,
          ),
          firstName: '',
          documentNumber: '',
          fullName: '',
        ),
        updatedAt: updateAt,
        createdAt: updateAt,
      ),
    ),
  );

  Uint8List unitList = Uint8List.fromList(
    [
      2,
      2,
      3,
    ],
  );
  /*

  const List<address.Address> addresses = [
    address.Address(+


      uuid: '121212',
      current: true,
      marketingZoneUuid: '1234123124',
    ),
    address.Address(uuid: '121213', current: false)
  ];

  const List<address.Address> addressesNotCurrent = [
    address.Address(
      uuid: '121212',
      current: false,
      status: 'enabled',
      warehouseUuid: '123',
      zoneUuid: '123',
    ),
    address.Address(
      uuid: '121213',
      current: false,
      status: 'coverage',
      warehouseUuid: '123',
      zoneUuid: '123',
    )
  ];

  const selectedUuid = '121212';
*/
  final mockRepository = MockRepository();

  const model = Model(
    numberPass: 4,
  );

  late BlocDemo bloc;

  setUp(() {
    bloc = BlocDemo(
      repository: mockRepository,
    );
  });
  test('should set initial state', () {
    expect(bloc.state, const InitialState(model));
  });
  blocTest<BlocDemo, DemoState>(
    'emits [ChangedPassNumberState] when ChangePassNumberEvent is change pass.',
    build: () => bloc,
    act: (bloc) => bloc.add(
      const ChangePassNumberEvent(
        passNumber: 2,
      ),
    ),
    expect: () => [
      ChangedPassNumberState(
        model.copyWith(
          numberPass: 2,
        ),
      ),
    ],
  );
  blocTest<BlocDemo, DemoState>(
    'emits [ChangedDocumentDetailoState] when ChangeInfoDetailEvent is change info.',
    build: () => bloc,
    act: (bloc) => bloc.add(
      ChangeInfoDetailEvent(
        documentDetails: documentDetails,
        imageScanned: unitList,
      ),
    ),
    expect: () => [
      ChangedDocumentDetailoState(
        model.copyWith(
          documentDetails: documentDetails,
          imageScanned: unitList,
        ),
      ),
    ],
  );

  blocTest<BlocDemo, DemoState>(
    'emits [ChangedSelfieImageState] when ChangeSelfieImagenEvent is change selfie.',
    build: () => bloc,
    act: (bloc) => bloc.add(
      ChangeSelfieImagenEvent(
        imageSelfie: unitList,
      ),
    ),
    expect: () => [
      ChangedSelfieImageState(
        model.copyWith(
          imageSelfie: unitList,
        ),
      ),
    ],
  );

  blocTest<BlocDemo, DemoState>(
    'emits [LoadedDetailState] when GetDetailsEvent is change selfie.',
    build: () {
      when(
        () => mockRepository.getDetails(base64Encode(unitList)),
      ).thenAnswer(
        (_) async => documentDetails,
      );
      return bloc;
    },
    act: (bloc) => bloc.add(
      GetDetailsEvent(
        imageScanned: unitList,
      ),
    ),
    expect: () => [
      const LoadingDetailsState(model),
      LoadedDetailState(
        model.copyWith(
          documentDetails: documentDetails,
          imageScanned: unitList,
        ),
      ),
    ],
  );
  blocTest<BlocDemo, DemoState>(
    'emits [ErrorDetailState] when GetDetailsEvent is change selfie.',
    build: () {
      when(
        () => mockRepository.getDetails(base64Encode(unitList)),
      ).thenThrow(
        (_) async {},
      );

      return bloc;
    },
    act: (bloc) => bloc.add(
      GetDetailsEvent(
        imageScanned: unitList,
      ),
    ),
    expect: () => [
      const LoadingDetailsState(model),
      const ErrorDetailState(
        model: model,
        message: '',
      ),
    ],
  );
}
