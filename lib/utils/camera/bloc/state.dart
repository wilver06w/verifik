part of 'bloc.dart';

@immutable
abstract class BlocState extends Equatable {
  final Model model;

  const BlocState(this.model);

  @override
  List<Object> get props => [model];
}

class InitialState extends BlocState {
  const InitialState(Model model) : super(model);
}

class LoadingState extends BlocState {
  const LoadingState(Model model) : super(model);
}

class ErrorState extends BlocState {
  final CameraException error;

  const ErrorState(Model model, {required this.error}) : super(model);
}

class PictureCapturedState extends BlocState {
  const PictureCapturedState(Model model) : super(model);
}

class ReadyToCaptureState extends BlocState {
  const ReadyToCaptureState(Model model) : super(model);
}

class Model extends Equatable {
  final CameraController? cameraController;
  final FlashMode? flashMode;
  final String? imagePath;

  bool get hasImage =>
      (imagePath?.isNotEmpty ?? false) && File(imagePath!).existsSync();

  File? get imageFile => hasImage ? File(imagePath!) : null;

  const Model({
    this.cameraController,
    this.imagePath,
    this.flashMode = FlashMode.off,
  });

  Model copyWith({
    CameraController? cameraController,
    String? imagePath,
    FlashMode? flashMode,
  }) {
    return Model(
      cameraController: cameraController ?? this.cameraController,
      imagePath: imagePath ?? this.imagePath,
      flashMode: flashMode ?? this.flashMode,
    );
  }

  @override
  List<Object?> get props => [
        imagePath,
        flashMode,
        cameraController,
      ];
}
