import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:octo_image/octo_image.dart';
import 'package:oktoast/oktoast.dart';
import 'package:verifik/app/models/data_dialog.dart';
import 'package:verifik/app/screen/demo/bloc/bloc.dart';
import 'package:verifik/app/screen/demo/repository.dart';
import 'package:verifik/app/utils/camera/bloc/bloc.dart';
import 'package:verifik/app/utils/colors.dart';
import 'package:verifik/app/utils/http/http_client.dart'
    hide ModularWatchExtension;
import 'package:verifik/app/utils/responsive.dart';
import 'package:verifik/app/utils/spacing.dart';
import 'package:verifik/app/utils/text/text.dart';
import 'package:verifik/app/utils/verifik_loading.dart';
import 'package:verifik/app/widget/xigo_loading_circle.dart';
import 'package:verifik/app/utils/xigo_ui.dart';
import 'package:verifik/app/widget/body_general_two.dart';
import 'package:verifik/app/widget/button.dart';

part 'package:verifik/app/screen/scanning/_sections/item_id.dart';

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
                child: const BlocListener<BlocDemo, DemoState>(
                  listener: _listener,
                  child: CustomDialog(),
                ),
              );
            },
          );

          if (value != null) {
            if (context.mounted) {
              final dataDialog = value as DataDialog;
              context.read<BlocDemo>().add(
                    ChangeInfoDetailEvent(
                      documentDetails: dataDialog.documentDetails,
                      imageScanned: dataDialog.imageMemory,
                    ),
                  );
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

Future<void> _listener(BuildContext context, DemoState state) async {
  if (state is LoadingDetailsState) {
    VerifikLoading.show(context);
  } else if (state is LoadedDetailState) {
    Navigator.pop(context);
    Navigator.pop(
      context,
      DataDialog(
        documentDetails: state.model.documentDetails!,
        imageMemory: context.read<BlocDemo>().state.model.imageScanned!,
      ),
    );
  } else if (state is ErrorDetailState) {
    Navigator.pop(context);
    showToast(
      state.message,
      backgroundColor: XigoColors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
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
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.15,
        vertical: size.height * 0.30,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0.2,
          ),
        ),
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
                            color: Colors.grey,
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
                    backgroundColor: Colors.white,
                    borderColor: Colors.grey,
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
