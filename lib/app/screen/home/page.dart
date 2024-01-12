import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:verifik/app/screen/demo/bloc/bloc.dart';
import 'package:verifik/app/utils/colors.dart';
import 'package:verifik/app/utils/responsive.dart';
import 'package:verifik/app/utils/spacing.dart';
import 'package:verifik/app/utils/text/text.dart';
import 'package:verifik/app/utils/xigo_ui.dart';
import 'package:verifik/app/widget/button.dart';
import 'package:verifik/app/widget/item_circular.dart';

part 'package:verifik/app/screen/home/_sections/item_card.dart';
part 'package:verifik/app/screen/home/_sections/options_card.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.network(
            InitProyectUiValues.businessWomanImage,
            height: XigoResponsive.heightSizeByContext(context, pixels: 470),
          ),
        ),
        ListView(
          padding: const EdgeInsets.symmetric(
            vertical: XigoSpacing.xl,
            horizontal: XigoSpacing.xl,
          ),
          children: [
            SvgPicture.network(
              InitProyectUiValues.stepOneLogo,
              width: XigoResponsive.withSizeByContext(context, pixels: 130),
              height: XigoResponsive.heightSizeByContext(context, pixels: 60),
            ),
            Gap(
              XigoResponsive.heightSizeByContext(
                context,
                pixels: XigoSpacing.lg,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: XigoResponsive.withSizeByContext(
                  context,
                  pixels: XigoSpacing.xxl,
                ),
              ),
              child: Column(
                children: [
                  XigoText.fontSizeCustom(
                    label: InitProyectUiValues
                        .exploreFutureIdentityValidationWithVerifik,
                    color: XigoColors.rybBlue,
                    textAlign: TextAlign.center,
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                  ),
                  Gap(
                    XigoResponsive.heightSizeByContext(
                      context,
                      pixels: XigoSpacing.md,
                    ),
                  ),
                  XigoText.body(
                    label: InitProyectUiValues.textWeFeatureCutting,
                    color: XigoColors.catalinaBlue.withOpacity(0.60),
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  ),
                  Gap(
                    XigoResponsive.heightSizeByContext(
                      context,
                      pixels: XigoSpacing.md,
                    ),
                  ),
                  XigoText.body(
                    label: InitProyectUiValues.discoverVerifik,
                    color: XigoColors.catalinaBlue.withOpacity(0.698),
                    fontWeight: FontWeight.w800,
                    textAlign: TextAlign.center,
                  ),
                  Gap(
                    XigoResponsive.heightSizeByContext(
                      context,
                      pixels: XigoSpacing.md,
                    ),
                  ),
                ],
              ),
            ),
            const OptionsCards(),
            Gap(
              XigoResponsive.heightSizeByContext(
                context,
                pixels: XigoSpacing.xl,
              ),
            ),
            Column(
              children: [
                Button(
                  title: InitProyectUiValues.startDemo,
                  backgroundColor: XigoColors.majorelleBlue,
                  onPressed: () {
                    context.read<BlocDemo>().add(
                          const ChangePassNumberEvent(
                            passNumber: 1,
                          ),
                        );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
