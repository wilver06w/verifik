part of 'package:verifik/screen/demo/page.dart';

class HeaderPassNumbers extends StatelessWidget {
  const HeaderPassNumbers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: XigoResponsive.heightSizeByContext(
        context,
        pixels: 40,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.10),
            spreadRadius: 5.0,
            blurRadius: 7.0,
            offset: const Offset(
              5,
              3,
            ),
          ),
        ],
      ),
      child: BlocSelector<BlocDemo, DemoState, int>(
        selector: (state) {
          return state.model.numberPass;
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: XigoSpacing.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                ItemPass(
                  passNumber: 1,
                  passSelected: state,
                  title: InitProyectUiValues.idScanning,
                ),
                ItemPass(
                  passNumber: 2,
                  passSelected: state,
                  title: InitProyectUiValues.documentDetails,
                ),
                ItemPass(
                  passNumber: 3,
                  passSelected: state,
                  title: InitProyectUiValues.livenessCheck,
                ),
                ItemPass(
                  passNumber: 4,
                  passSelected: state,
                  title: InitProyectUiValues.results,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
