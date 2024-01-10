import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class BlocDemo extends Bloc<DemoEvent, DemoState> {
  BlocDemo(
      /* {
    required this.repository,
  }*/
      )
      : super(const InitialState(Model())) {
    on<ChangePassNumberEvent>(_onChangePassNumberEvent);
    on<ChangedOptionSelectedEvent>(_onChangedOptionSelectedEvent);
    on<GetExperiencesEvent>(_onGetExperiencesEvent);
    on<GetProjectsEvent>(_onGetProjectsEvent);
  }

  //TODO: Descomentar
  // final Repository repository;

  void _onChangePassNumberEvent(
    ChangePassNumberEvent event,
    Emitter<DemoState> emit,
  ) {
    emit(
      ChangedPassNumberState(
        state.model.copyWith(
          numberPass: event.passNumber,
        ),
      ),
    );
  }

  void _onChangedOptionSelectedEvent(
    ChangedOptionSelectedEvent event,
    Emitter<DemoState> emit,
  ) {
    emit(
      ChangedOptionSelected(
        state.model.copyWith(
          optionSelected: event.optionSelected,
        ),
      ),
    );
  }

  void _onGetExperiencesEvent(
    GetExperiencesEvent event,
    Emitter<DemoState> emit,
  ) {
    //TODO: Descomentar
    //  final experiences = repository.getExperiences();

    /*emit(
      GetExperiencesState(
        state.model.copyWith(
          experiences: experiences,
        ),
      ),
    );
    */
  }

  void _onGetProjectsEvent(
    GetProjectsEvent event,
    Emitter<DemoState> emit,
  ) {
    //TODO: Descomentar
    //  final projects = repository.getProjects();

    emit(
      GetProjectsState(
        state.model.copyWith(
            // projects: projects,
            ),
      ),
    );
  }
}
