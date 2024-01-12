import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:octo_image/octo_image.dart';
import 'package:oktoast/oktoast.dart';
import 'package:verifik/app/screen/demo/bloc/bloc.dart';
import 'package:verifik/app/utils/camera/bloc/bloc.dart';
import 'package:verifik/app/utils/colors.dart';
import 'package:verifik/app/utils/responsive.dart';
import 'package:verifik/app/utils/spacing.dart';
import 'package:verifik/app/utils/text/text.dart';
import 'package:verifik/app/utils/verifik_loading.dart';
import 'package:verifik/app/widget/xigo_loading_circle.dart';
import 'package:verifik/app/utils/xigo_ui.dart';
import 'package:verifik/app/widget/button.dart';

part 'package:verifik/app/screen/camera/_sections/view_camera.dart';
part 'package:verifik/app/screen/camera/_sections/view_captured.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BlocCamera()..add(LoadEvent()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<BlocCamera, BlocCameraState>(
            listener: _listener,
          ),
          BlocListener<BlocDemo, DemoState>(
            listener: _listenerDemo,
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.all(XigoSpacing.sm),
          child: Column(
            children: [
              XigoText.fontSizeCustom(
                label: InitProyectUiValues.getCloser,
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              XigoText.body(
                label: InitProyectUiValues
                    .pleaseComeBitCloserBetterFaceRecognition,
                color: Colors.black,
              ),
              Gap(
                XigoResponsive.heightSizeByContext(
                  context,
                  pixels: XigoSpacing.xs,
                ),
              ),
              BlocBuilder<BlocCamera, BlocCameraState>(
                builder: (context, state) {
                  return Center(
                    child: state is ReadyToCaptureState
                        ? ViewCamera(
                            state: state,
                          )
                        : state is ErrorState
                            ? const SizedBox()
                            : state is PictureCapturedState
                                ? ViewImageCaptured(
                                    state: state,
                                  )
                                : const Center(
                                    child: XigoLoadingCircle(),
                                  ),
                  );
                },
              ),
              Gap(
                XigoResponsive.heightSizeByContext(
                  context,
                  pixels: XigoSpacing.md,
                ),
              ),
              Button(
                title: InitProyectUiValues.goBack,
                onPressed: () {
                  context.read<BlocDemo>().add(
                        const ChangePassNumberEvent(
                          passNumber: 2,
                        ),
                      );
                },
                colorText: XigoColors.majorelleBlue,
                borderColor: XigoColors.azureishWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _listenerDemo(BuildContext context, DemoState state) async {
    if (state is ChangedSelfieImageState) {
      context.read<BlocDemo>().add(GetLivenessDataEvent());
    } else if (state is LoadingLivenessState) {
      VerifikLoading.show(context);
    } else if (state is LoadedLivenessState) {
      context.read<BlocDemo>().add(GetCompareRecognitionEvent());
    } else if (state is ErrorLivenessState) {
      Navigator.pop(context);
      showToast(
        state.message,
        backgroundColor: XigoColors.rybBlue,
        textStyle: const TextStyle(
          color: Colors.white,
        ),
      );
    } else if (state is ErrorCompareRecognitionState) {
      Navigator.pop(context);
      showToast(
        state.message,
        backgroundColor: XigoColors.rybBlue,
        textStyle: const TextStyle(
          color: Colors.white,
        ),
      );
    } else if (state is LoadedCompareRecognitionState) {
      Navigator.pop(context);
      context.read<BlocDemo>().add(
            const ChangePassNumberEvent(
              passNumber: 4,
            ),
          );
    }
  }

  Future<void> _listener(BuildContext context, BlocCameraState state) async {
    if (state is LoadingState) {
      VerifikLoading.show(context);
    } else if (state is PictureCapturedState) {
      Navigator.pop(context);
      context.read<BlocDemo>().add(
            ChangeSelfieImagenEvent(
              imageSelfie: state.model.selfieImageMemory!,
            ),
          );
    } else if (state is ReadyToCaptureState) {
      Navigator.pop(context);
    } else if (state is ErrorState) {
      Navigator.pop(context);
    }
  }
}
