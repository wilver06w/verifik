import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:verifik/app/screen/demo/bloc/bloc.dart';
import 'package:verifik/app/screen/demo/repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  /* const client = Client(
    uuid: '120120',
    document: 'DocumentTest',
    docType: 'CC',
    email: 'test@test.com',
    gender: 'male',
    lastName: 'LastNameTest',
    type: 'builder',
    name: 'NameTest',
  );

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

}
