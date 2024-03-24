import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/themes/themes.dart';
import '../../engine/engine.dart';
import '../widgets.dart';
import '../../modules/dashboard/profile/cubit/profile_cubit.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({
    super.key,
    required this.cubit,
    required this.imageUrl,
    required this.pickedImage,
    required this.pickCameraPressed,
    required this.pickGaleryPressed,
    this.pickFilePressed,
    this.fileEnable = false,
    this.label,
  });
  final String? label;
  final bool fileEnable;
  final ProfileCubit cubit;
  final String? imageUrl;
  final XFile? pickedImage;
  final void Function()? pickGaleryPressed;
  final void Function()? pickCameraPressed;
  final void Function()? pickFilePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  label ?? "",
                  style: AppFont.largeBold(context),
                ),
              )
            : const SizedBox(),
        DottedBorder(
          dashPattern: [6, 6],
          borderType: BorderType.RRect,
          color: Colors.grey,
          child: InkWell(
            onTap: () {
              popUpSelectFile(context);
            },
            child: Container(
              height: 163,
              width: baseWidth,
              decoration: const BoxDecoration(
                color: Color(0xffF8F9FD),
              ),
              child: (pickedImage != null)
                  ? (pickedImage!.path.endsWith('.pdf'))
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 300),
                          child: CustomButton(
                            onPressed: () {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (context) {
                                  return Container(
                                      height: baseHeight,
                                      width: baseWidth / 2,
                                      child: SfPdfViewer.file(
                                        File(pickedImage?.path ?? ""),
                                      ));
                                },
                              );
                            },
                            child: Center(
                              child: Container(
                                  height: 100,
                                  width: 100,
                                  child: SfPdfViewer.file(
                                    File(pickedImage?.path ?? ""),
                                  )),
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 260,
                          width: 100,
                          child: Image.file(
                            File(pickedImage?.path ?? ""),
                          ),
                        )
                  : imageUrl != null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (imageUrl!.endsWith('.pdf'))
                                ? CustomButton(
                                    onPressed: () {
                                      showCupertinoModalPopup(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            height: baseHeight,
                                            width: baseWidth / 2,
                                            child: SfPdfViewer.network(
                                                Environment.showUrlImage(
                                                    path: imageUrl ?? "")),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      child: SfPdfViewer.network(
                                          Environment.showUrlImage(
                                              path: imageUrl ?? "")),
                                    ),
                                  )
                                // CustomButton(
                                //     onPressed: () {
                                //       showCupertinoModalPopup(
                                //         context: context,
                                //         builder: (context) {
                                //           return Container(
                                //             height: baseHeight,
                                //             width: baseWidth / 2,
                                //             child: PDF(
                                //               swipeHorizontal: false,
                                //             ).cachedFromUrl(
                                //                 Environment.showUrlImage(
                                //                     path: imageUrl ?? "")),
                                //           );
                                //         },
                                //       );
                                //     },
                                //     child: Container(
                                //       height: 100,
                                //       width: 100,
                                //       child: PDF(
                                //         swipeHorizontal: true,
                                //       ).cachedFromUrl(Environment.showUrlImage(
                                //           path: imageUrl ?? "")),
                                //     ),
                                //   )
                                : ImageLoad(
                                    padding: const EdgeInsets.all(12),
                                    fit: BoxFit.cover,
                                    height: 100,
                                    imageUrl: Environment.showUrlImage(
                                        path: imageUrl ?? "")),
                            const Text("Tap untuk ubah foto")
                          ],
                        )
                      : (pickedImage != null)
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 260,
                              width: double.infinity,
                              child: (pickedImage!.path.endsWith('.pdf'))
                                  ? Container(
                                      height: 200,
                                      width: 200,
                                      child: SfPdfViewer.file(
                                        File(pickedImage!.path),
                                      ),
                                    )
                                  : Image.file(
                                      File(pickedImage!.path),
                                    ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.image, size: 70),
                                const SizedBox(height: 12),
                                Text(label ?? "Upload Foto"),
                              ],
                            ),
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> popUpSelectFile(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: const Text("Pilih gambar yang akan ditampilkan"),
          actions: [
            Row(
              children: [
                Expanded(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(38),
                  child: SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        onPressed: pickGaleryPressed,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38),
                          ),
                        ),
                        child: const Text('Ambil dari galeri'),
                      )),
                )),
                const SizedBox(width: 12),
                Expanded(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(38),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: pickCameraPressed,
                        child: const Text("Ambil foto")),
                  ),
                )),
                const SizedBox(width: 12),
                (fileEnable == true)
                    ? Expanded(
                        child: ClipRRect(
                        borderRadius: BorderRadius.circular(38),
                        child: SizedBox(
                            height: 50,
                            child: OutlinedButton(
                              onPressed: pickFilePressed,
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(38),
                                ),
                              ),
                              child: const Text('Ambil dari file'),
                            )),
                      ))
                    : SizedBox(),
              ],
            ),
          ],
        );
      },
    );
  }
}
