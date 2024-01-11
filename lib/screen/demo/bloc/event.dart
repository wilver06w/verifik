part of 'bloc.dart';

abstract class DemoEvent extends Equatable {
  const DemoEvent();

  @override
  List<Object> get props => [];
}

class ChangePassNumberEvent extends DemoEvent {
  final int passNumber;

  const ChangePassNumberEvent({
    required this.passNumber,
  });
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
