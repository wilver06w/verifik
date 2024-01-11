import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:octo_image/octo_image.dart';
import 'package:verifik/models/data_dialog.dart';
import 'package:verifik/screen/demo/bloc/bloc.dart';
import 'package:verifik/screen/demo/repository.dart';
import 'package:verifik/utils/camera/bloc/bloc.dart';
import 'package:verifik/utils/colors.dart';
import 'package:verifik/utils/http/http_client.dart' hide ModularWatchExtension;
import 'package:verifik/utils/responsive.dart';
import 'package:verifik/utils/spacing.dart';
import 'package:verifik/utils/text/text.dart';
import 'package:verifik/utils/verifik_loading.dart';
import 'package:verifik/utils/xigo_loading_circle.dart';
import 'package:verifik/utils/xigo_ui.dart';
import 'package:verifik/widget/body_general_two.dart';
import 'package:verifik/widget/button.dart';

part 'package:verifik/screen/camera/_sections/view_camera.dart';
part 'package:verifik/screen/camera/_sections/view_captured.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BlocCamera()..add(LoadEvent()),
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
              label:
                  InitProyectUiValues.pleaseComeBitCloserBetterFaceRecognition,
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
                              : const XigoLoadingCircle(),
                );
              },
            ),

            /*    context.read<BlocCamera>().add(
                                      CaptureImageEvent(),
                                    )
          */
          ],
        ),
      ),
    );
  }
}
