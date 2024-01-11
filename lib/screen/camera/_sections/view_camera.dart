part of 'package:verifik/screen/camera/page.dart';

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
        SizedBox(
          width: XigoResponsive.withSizeByContext(
            context,
            pixels: 270,
          ),
          height: XigoResponsive.heightSizeByContext(
            context,
            pixels: 500,
          ),
          child: CameraPreview(
            state.model.cameraController!,
          ),
        ),

        /*  CustomPaint(
  painter: CirclePainter(), // Define a custom painter for the circle
  child: GestureDetector(
    onTap: () => _takePhoto(), // Trigger photo capture when tapped
  ),
)*/
        Column(
          children: [
            Container(
              width: XigoResponsive.withSizeByContext(
                context,
                pixels: 270,
              ),
              height: XigoResponsive.heightSizeByContext(
                context,
                pixels: 500,
              ),
              decoration: BoxDecoration(
                color: XigoColors.azureishWhite,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
