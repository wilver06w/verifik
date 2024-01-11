import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verifik/screen/demo/repository.dart';
import 'package:verifik/models/document.dart';

part 'event.dart';
part 'state.dart';

class BlocDemo extends Bloc<DemoEvent, DemoState> {
  BlocDemo({
    required this.repository,
  }) : super(const InitialState(Model())) {
    on<ChangePassNumberEvent>(_onChangePassNumberEvent);
    on<ChangedOptionSelectedEvent>(_onChangedOptionSelectedEvent);
    on<GetDetailsEvent>(_onGetDetailsEvent);
    on<GetProjectsEvent>(_onGetProjectsEvent);
  }

  final Repository repository;

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

  Future<void> _onGetDetailsEvent(
    GetDetailsEvent event,
    Emitter<DemoState> emit,
  ) async {
    try {
      emit(LoadingDetailsState(state.model));
      final imageTemp = base64Encode(event.imageScanned);
      final documentDetails = await repository.getDetails(imageTemp);

      emit(
        LoadedDetailState(
          state.model.copyWith(
            documentDetails: documentDetails,
            imageScanned: event.imageScanned,
          ),
        ),
      );
    } catch (_) {
      emit(ErrorDetailState(state.model));
    }
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
