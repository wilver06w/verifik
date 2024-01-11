part of 'package:verifik/screen/camera/page.dart';

class ViewImageCaptured extends StatelessWidget {
  const ViewImageCaptured({
    super.key,
    required this.state,
  });
  final BlocCameraState state;

  @override
  Widget build(BuildContext context) {
    return state.model.imageMemory != null
        ? Image.memory(
            state.model.imageMemory!,
            width: XigoResponsive.withSizeByContext(
              context,
              pixels: 310,
            ),
            height: XigoResponsive.heightSizeByContext(
              context,
              pixels: 120,
            ),
          )
        : OctoImage(
            image: FileImage(state.model.imageFile!),
            placeholderBuilder: (_) => const XigoLoadingCircle(),
          );
  }
}
