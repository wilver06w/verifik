part of 'package:verifik/app/screen/camera/page.dart';

class ViewCamera extends StatelessWidget {
  const ViewCamera({
    super.key,
    required this.state,
  });
  final BlocCameraState state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: SizedBox(
            width: XigoResponsive.withSizeByContext(
              context,
              pixels: 270,
            ),
            height: XigoResponsive.heightSizeByContext(
              context,
              pixels: 400,
            ),
            child: CameraPreview(
              state.model.cameraController!,
            ),
          ),
        ),
        Container(
          width: XigoResponsive.withSizeByContext(
            context,
            pixels: 270,
          ),
          height: XigoResponsive.heightSizeByContext(
            context,
            pixels: 400,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(95),
            borderRadius: BorderRadius.circular(
              20.0,
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: 0,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: XigoResponsive.withSizeByContext(
                    context,
                    pixels: 120,
                  ),
                  height: XigoResponsive.heightSizeByContext(
                    context,
                    pixels: 250,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                ),
                Gap(
                  XigoResponsive.heightSizeByContext(
                    context,
                    pixels: XigoSpacing.md,
                  ),
                ),
                Button(
                  title: InitProyectUiValues.takePhoto,
                  backgroundColor: XigoColors.majorelleBlue,
                  onPressed: () {
                    context.read<BlocCamera>().add(
                          CaptureImageEvent(),
                        );

/*                    context.read<BlocDemo>().add(
                          const ChangePassNumberEvent(
                            passNumber: 3,
                          ),
                        );
 */
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
