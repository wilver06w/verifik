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

class LoadingDetailsState extends DemoState {
  const LoadingDetailsState(Model model) : super(model);
}

class LoadedDetailState extends DemoState {
  const LoadedDetailState(Model model) : super(model);
}

class ErrorDetailState extends DemoState {
  const ErrorDetailState(Model model) : super(model);
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
//TODO: pasas a 0
    this.numberPass = 1,
    this.documentDetails,
    this.imageScanned,
  });

  final int optionSelected;
  final int numberPass;
  final DocumentDetails? documentDetails;
  final Uint8List? imageScanned;

  Model copyWith({
    int? optionSelected,
    int? numberPass,
    Uint8List? imageScanned,
    DocumentDetails? documentDetails,
  }) {
    return Model(
      optionSelected: optionSelected ?? this.optionSelected,
      numberPass: numberPass ?? this.numberPass,
      documentDetails: documentDetails ?? this.documentDetails,
      imageScanned: imageScanned ?? this.imageScanned,
    );
  }

  @override
  List<Object?> get props {
    return [
      optionSelected,
      numberPass,
      documentDetails,
      imageScanned,
    ];
  }
}
