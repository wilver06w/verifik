part of 'package:verifik/screen/camera/page.dart';

class ViewImageCaptured extends StatelessWidget {
  const ViewImageCaptured({
    super.key,
    required this.state,
  });
  final BlocCameraState state;

  @override
  Widget build(BuildContext context) {
    return state.model.selfieImageMemory != null
        ? Image.memory(
            state.model.selfieImageMemory!,
            width: XigoResponsive.withSizeByContext(
              context,
              pixels: 270,
            ),
            height: XigoResponsive.heightSizeByContext(
              context,
              pixels: 500,
            ),
          )
        : OctoImage(
            width: XigoResponsive.withSizeByContext(
              context,
              pixels: 310,
            ),
            height: XigoResponsive.heightSizeByContext(
              context,
              pixels: 120,
            ),
            image: FileImage(state.model.selfieImageFile!),
            placeholderBuilder: (_) => const XigoLoadingCircle(),
          );
  }
}
