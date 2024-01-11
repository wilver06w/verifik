import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:octo_image/octo_image.dart';
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
part 'package:verifik/screen/scanning/_sections/item_id.dart';

class ScanningPage extends StatelessWidget {
  const ScanningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyGeneralTwo(
      widgetLeft: ItemID(
        title: InitProyectUiValues.uploadedIdDocument,
        imageUrl: InitProyectUiValues.uploadImageTemp,
        titleButton: InitProyectUiValues.uploadFile,
        onPressed: () async {
          var value = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider<BlocCamera>.value(
                    value: Modular.get<BlocCamera>(),
                  ),
                  BlocProvider(
                    create: (context) => BlocDemo(
                      repository: Repository(
                        xigoHttpClient: Modular.get<XigoHttpClient>(),
                      ),
                    ),
                  ),
                ],
                child: BlocListener<BlocDemo, DemoState>(
                  listener: (context, state) {
                    if (state is LoadingDetailsState) {
                      VerifikLoading.show(context);
                    } else if (state is LoadedDetailState) {
                      Navigator.pop(context);
                      Navigator.pop(context, true);
                    } else if (state is ErrorDetailState) {
                      Navigator.pop(context);
                    }
                  },
                  child: const CustomDialog(),
                ),
              );
            },
          );

          if (value) {
            if (context.mounted) {
              context.read<BlocDemo>().add(
                    const ChangePassNumberEvent(
                      passNumber: 2,
                    ),
                  );
            }
          }
        },
      ),
      widgetRight: ItemID(
        isBackgroundWhite: true,
        title: InitProyectUiValues.scanIdDocument,
        imageUrl: InitProyectUiValues.scanIdDocumentImage,
        titleButton: InitProyectUiValues.startScanning,
        onPressed: () {
          context.read<BlocDemo>().add(
                const ChangePassNumberEvent(
                  passNumber: 2,
                ),
              );
        },
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(XigoSpacing.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(XigoSpacing.xs),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: XigoColors.rybBlue,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        BlocBuilder<BlocCamera, BlocCameraState>(
                          builder: (context, state) {
                            return (state.model.imagePath ?? '').isNotEmpty
                                ? (kIsWeb
                                    ? Image.memory(
                                        state.model.imageMemory!,
                                        height: 100,
                                        width: 100,
                                      )
                                    : OctoImage(
                                        image:
                                            FileImage(state.model.imageFile!),
                                        placeholderBuilder: (_) =>
                                            const XigoLoadingCircle(),
                                      ))
                                : const SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Icon(
                                      Icons.upload_file,
                                    ),
                                  );
                          },
                        ),
                        Gap(
                          XigoResponsive.withSizeByContext(
                            context,
                            pixels: 10,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            XigoText.labelText(
                              label: InitProyectUiValues.dragDropPhotoHere,
                              fontWeight: FontWeight.bold,
                            ),
                            XigoText.small(
                              label: InitProyectUiValues.idDocumentFile,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        context.read<BlocCamera>().add(
                              PickFileFromGalleryEvent(),
                            );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(
                          XigoSpacing.xs,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: XigoColors.rybBlue,
                          border: Border.all(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                        child: XigoText.body(
                          label: InitProyectUiValues.findFileDevice,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Gap(
                      XigoResponsive.heightSizeByContext(
                        context,
                        pixels: XigoSpacing.sm,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(
                XigoResponsive.heightSizeByContext(
                  context,
                  pixels: XigoSpacing.sm,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    title: InitProyectUiValues.cancel,
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    colorText: Colors.red,
                  ),
                  Gap(
                    XigoResponsive.withSizeByContext(
                      context,
                      pixels: XigoSpacing.sm,
                    ),
                  ),
                  BlocBuilder<BlocCamera, BlocCameraState>(
                    builder: (context, state) {
                      return Button(
                        title: InitProyectUiValues.continu,
                        backgroundColor: XigoColors.majorelleBlue,
                        onPressed: (state.model.imagePath ?? '').isEmpty
                            ? null
                            : () {
                                context.read<BlocDemo>().add(
                                      GetDetailsEvent(
                                        imageScanned: context
                                            .read<BlocCamera>()
                                            .state
                                            .model
                                            .imageMemory!,
                                      ),
                                    );
                              },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
