part of 'bloc.dart';

abstract class DemoState extends Equatable {
  final Model model;
  const DemoState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends DemoState {
  const InitialState(Model model) : super(model);
}

class ChangedPassNumberState extends DemoState {
  const ChangedPassNumberState(Model model) : super(model);
}

//TODO: revisar remover.
class ChangedOptionSelected extends DemoState {
  const ChangedOptionSelected(Model model) : super(model);
}

class GetExperiencesState extends DemoState {
  const GetExperiencesState(Model model) : super(model);
}

class GetProjectsState extends DemoState {
  const GetProjectsState(Model model) : super(model);
}

class Model extends Equatable {
  const Model({
    this.optionSelected = 0,
    this.numberPass = 0,
  });

  final int optionSelected;
  final int numberPass;

  Model copyWith({
    int? optionSelected,
    int? numberPass,
  }) {
    return Model(
      optionSelected: optionSelected ?? this.optionSelected,
      numberPass: numberPass ?? this.numberPass,
    );
  }

  @override
  List<Object?> get props {
    return [
      optionSelected,
      numberPass,
    ];
  }
}
