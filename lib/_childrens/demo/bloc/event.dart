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

//TODO: revisar para remover
class ChangedOptionSelectedEvent extends DemoEvent {
  final int optionSelected;

  const ChangedOptionSelectedEvent({
    required this.optionSelected,
  });
}

class GetExperiencesEvent extends DemoEvent {}

class GetProjectsEvent extends DemoEvent {}
