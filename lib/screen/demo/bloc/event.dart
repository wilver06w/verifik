part of 'bloc.dart';

abstract class DemoEvent extends Equatable {
  const DemoEvent();

  @override
  List<Object> get props => [];
}

class ChangePassNumberEvent extends DemoEvent {
  const ChangePassNumberEvent({
    required this.passNumber,
  });

  final int passNumber;
}

class ChangeInfoDetailEvent extends DemoEvent {
  const ChangeInfoDetailEvent({
    required this.documentDetails,
  });

  final DocumentDetails documentDetails;
}

class GetDetailsEvent extends DemoEvent {
  const GetDetailsEvent({
    required this.imageScanned,
  });
  final Uint8List imageScanned;
}

//TODO: revisar para remover
class ChangedOptionSelectedEvent extends DemoEvent {
  final int optionSelected;

  const ChangedOptionSelectedEvent({
    required this.optionSelected,
  });
}

class GetProjectsEvent extends DemoEvent {}
