import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:verifik/utils/camera/bloc/bloc.dart';
import 'package:verifik/utils/camera/camera_button_style.dart';
import 'package:verifik/utils/colors.dart';
import 'package:verifik/utils/spacing.dart';
import 'package:verifik/utils/text/text.dart';
import 'package:verifik/utils/xigo_loading_circle.dart';
import 'package:verifik/utils/xigo_ui.dart';

typedef CameraErrorCallback = void Function(CameraException);

typedef CameraErrorBuilder = Widget Function(CameraException);

class XigoCamera {
  /// Opens the camera in full screen to capture images.
  ///
  /// Parameters:
  ///
  /// * [captureAgainLabel]: The label that is shown in the button that dismisses
  /// the captured images and restarts the capture process.
  /// * [finishCaptureLabel]: The label that is shown in the button that closes
  /// the camera and returns the captured image.
  /// * [onError]: Callback to receive any error encountered meanwhile the camera
  /// is working.
  /// * [cameraErrorBuilder]: Builder that will be used to display a widget over
  /// the camera when an error occurs. If null, nothing is displayed.
  /// * [showGalleryButton]: Whatever to display the buttons that opens the
  /// gallery to pick a picture from the device memory.
  /// * [maxFileSizeBytes]: The size in bytes that the returned image will have.
  /// If the image is over this size it will be compressed to match the condition.
  /// * [primaryLabel]: Label that is shown over the camera buttons. This label
  /// has more fontWeight and is atop of the [secondaryLabel].
  /// If null, nothing is displayed.
  /// * [secondaryLabel]: Label that is shown over the camera buttons. This label
  /// is thinner and is placed below the [primaryLabel].
  /// If null, nothing is displayed.
  static Future<String?> openCamera({
    required String retryButtonLabel,
    required String finishButtonLabel,
    bool showGalleryButton = true,
    int? maxFileSizeBytes,
    String? primaryLabel,
    String? secondaryLabel,
    CameraErrorCallback? onError,
    CameraErrorBuilder? cameraErrorBuilder,
    TransitionBuilder? transitionBuilder,
    CameraButtonStyle? retryButtonLabelStyle,
    CameraButtonStyle? finishButtonLabelStyle,
    Key? captureButtonKey,
    Key? finishButtonKey,
    Key? retryButtonKey,
  }) async {
    try {
      return Modular.to.push<String?>(
        _TulCameraModal(
          retryButtonLabel: retryButtonLabel,
          finishButtonLabel: finishButtonLabel,
          primaryLabel: primaryLabel,
          secondaryLabel: secondaryLabel,
          showGalleryButton: showGalleryButton,
          maxFileSizeBytes: maxFileSizeBytes,
          onError: onError,
          cameraErrorBuilder: cameraErrorBuilder,
          transitionBuilder: transitionBuilder,
          retryButtonLabelStyle: retryButtonLabelStyle,
          finishButtonLabelStyle: finishButtonLabelStyle,
          captureButtonKey: captureButtonKey,
          finishButtonKey: finishButtonKey,
          retryButtonKey: retryButtonKey,
        ),
      );
    } catch (_) {
      if (onError != null) {
        //TODO: remover
        //  onError(CameraException('Error opening camera.', null));
      }
    }
    return null;
  }
}

class _TulCameraModal extends ModalRoute<String?> {
  final String retryButtonLabel;
  final String finishButtonLabel;
  final bool showGalleryButton;
  final int? maxFileSizeBytes;
  final String? primaryLabel;
  final String? secondaryLabel;
  final CameraErrorCallback? onError;
  final CameraErrorBuilder? cameraErrorBuilder;
  final TransitionBuilder? transitionBuilder;
  final CameraButtonStyle? retryButtonLabelStyle;
  final CameraButtonStyle? finishButtonLabelStyle;
  final Key? captureButtonKey;
  final Key? finishButtonKey;
  final Key? retryButtonKey;

  bool get hasPrimaryLabel => primaryLabel?.isNotEmpty ?? false;

  bool get hasSecondaryLabel => secondaryLabel?.isNotEmpty ?? false;

  _TulCameraModal({
    required this.retryButtonLabel,
    required this.finishButtonLabel,
    this.showGalleryButton = true,
    this.maxFileSizeBytes,
    this.primaryLabel,
    this.secondaryLabel,
    this.onError,
    this.cameraErrorBuilder,
    this.transitionBuilder,
    this.retryButtonLabelStyle,
    this.finishButtonLabelStyle,
    this.captureButtonKey,
    this.finishButtonKey,
    this.retryButtonKey,
  });

  Future _listener(BuildContext context, BlocState state) async {
    if (state is ErrorState && onError != null) {
      onError!(state.error);
    }
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => BlocCamera()..add(LoadEvent()),
      child: Scaffold(
        body: BlocConsumer<BlocCamera, BlocState>(
          listener: _listener,
          builder: (context, state) {
            return Container(
              color: XigoColors.textColor,
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: state is ReadyToCaptureState
                          ? CameraPreview(state.model.cameraController!)
                          : state is ErrorState && cameraErrorBuilder != null
                              ? cameraErrorBuilder != null
                                  ? cameraErrorBuilder!(state.error)
                                  : const SizedBox()
                              : state is PictureCapturedState
                                  ? OctoImage(
                                      image: FileImage(state.model.imageFile!),
                                      placeholderBuilder: (_) =>
                                          const XigoLoadingCircle(),
                                    )
                                  : const XigoLoadingCircle(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: XigoSpacing.lg,
                      vertical: XigoSpacing.lg,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (hasPrimaryLabel) ...[
                          const SizedBox(height: XigoSpacing.sl),
                          XigoText.body(
                            label: primaryLabel ?? '',
                            fontWeight: FontWeight.bold,
                            color: XigoColors.textColor,
                          ),
                        ],
                        if (hasSecondaryLabel) ...[
                          const SizedBox(height: XigoSpacing.sl),
                          XigoText.labelText(
                            label: secondaryLabel ?? '',
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w400,
                            color: XigoColors.textColor,
                            letterSpacing: -0.12,
                          ),
                        ],
                        if (hasPrimaryLabel || hasSecondaryLabel) ...[
                          const SizedBox(height: XigoSpacing.md),
                        ],
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (state is! PictureCapturedState) ...[
                              Expanded(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: state is! LoadingState
                                        ? XigoColors.textColor
                                        : XigoColors.textColor,
                                  ),
                                  onPressed: state is! LoadingState
                                      ? () => Modular.to.pop()
                                      : null,
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  key: captureButtonKey,
                                  onTap: state is ReadyToCaptureState
                                      ? () => context.read<BlocCamera>().add(
                                            CaptureImageEvent(
                                              maxFileSizeBytes:
                                                  maxFileSizeBytes ?? 0,
                                            ),
                                          )
                                      : null,
                                  child: SvgPicture.asset(
                                    InitProyectUiValues.about,
                                    height: 40.0,
                                    colorFilter: ColorFilter.mode(
                                      state is ReadyToCaptureState
                                          ? XigoColors.textColor
                                          : XigoColors.textColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                              if (showGalleryButton) ...[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: XigoSpacing.lg,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: XigoColors.textColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.photo_library,
                                          color: state is ReadyToCaptureState
                                              ? XigoColors.textColor
                                              : XigoColors.textColor,
                                        ),
                                        onPressed: state is ReadyToCaptureState
                                            ? () => context
                                                .read<BlocCamera>()
                                                .add(
                                                  PickFileFromGalleryEvent(
                                                    maxFileSizeBytes:
                                                        maxFileSizeBytes ?? 0,
                                                  ),
                                                )
                                            : null,
                                      ),
                                    ),
                                  ),
                                )
                              ]
                            ],
                            if (state is PictureCapturedState) ...[
                              InkWell(
                                key: retryButtonKey,
                                child: XigoText.fontSizeCustom(
                                  label: retryButtonLabel,
                                  textAlign: TextAlign.center,
                                  fontWeight:
                                      retryButtonLabelStyle?.fontWeight ??
                                          FontWeight.w400,
                                  color: retryButtonLabelStyle?.labelColor ??
                                      XigoColors.rybBlue,
                                  fontSize:
                                      retryButtonLabelStyle?.fontSize ?? 14,
                                ),
                                onTap: () => context.read<BlocCamera>().add(
                                      ClearCaptureEvent(),
                                    ),
                              ),
                              //TODO: remover
                              /*   XigoBtnCustom(
                                key: finishButtonKey,
                                label: finishButtonLabel,
                                labelColor:
                                    finishButtonLabelStyle?.labelColor ??
                                        XigoColors.white,
                                labelFontWeight:
                                    finishButtonLabelStyle?.fontWeight,
                                buttonColor:
                                    finishButtonLabelStyle?.backgroundColor ??
                                        XigoColors.ufoGreen,
                                onTap: () =>
                                    Modular.to.pop(state.model.imagePath),
                              ),
                              */
                            ]
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return transitionBuilder != null
        ? transitionBuilder!(context, child)
        : SlideTransition(
            position: Tween(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
  }

  @override
  Color? get barrierColor => XigoColors.textColor;

  @override
  bool get barrierDismissible => false;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 250);
}
