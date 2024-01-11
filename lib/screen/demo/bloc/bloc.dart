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
    on<ChangeInfoDetailEvent>(_onChangeInfoDetailEvent);
    on<ChangeSelfieImagenEvent>(_onChangeSelfieImagenEvent);
    on<ChangePassNumberEvent>(_onChangePassNumberEvent);
    on<ChangedOptionSelectedEvent>(_onChangedOptionSelectedEvent);
    on<GetDetailsEvent>(_onGetDetailsEvent);
    on<GetCompareRecognitionEvent>(_onGetCompareRecognitionEvent);
    on<GetProjectsEvent>(_onGetProjectsEvent);
  }
  final Repository repository;

  void _onChangeInfoDetailEvent(
    ChangeInfoDetailEvent event,
    Emitter<DemoState> emit,
  ) {
    emit(
      ChangedDocumentDetailoState(
        state.model.copyWith(
          documentDetails: event.documentDetails,
          imageScanned: event.imageScanned,
        ),
      ),
    );
  }

  void _onChangeSelfieImagenEvent(
    ChangeSelfieImagenEvent event,
    Emitter<DemoState> emit,
  ) {
    emit(
      ChangedSelfieImageState(
        state.model.copyWith(
          imageSelfie: event.imageSelfie,
        ),
      ),
    );
  }

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

  Future<void> _onGetCompareRecognitionEvent(
    GetCompareRecognitionEvent event,
    Emitter<DemoState> emit,
  ) async {
    try {
      emit(LoadingLivenessState(state.model));
      final imageSelfie = base64Encode(state.model.imageSelfie!);
      final imageGallery = base64Encode(state.model.imageScanned!);
      final documentDetails = await repository.getCompareRecognition(
        probe: imageSelfie,
        gallery: imageGallery,
      );

      emit(
        LoadedLivenessState(
          state.model.copyWith(),
        ),
      );
    } catch (_) {
      emit(ErrorLivenessState(state.model));
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
