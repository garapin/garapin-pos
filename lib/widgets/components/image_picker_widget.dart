import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/themes/themes.dart';
import '../../engine/engine.dart';
import '../widgets.dart';
import '../../modules/dashboard/profile/cubit/profile_cubit.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({
    super.key,
    required this.cubit,
    required this.imageUrl,
    required this.pickedImage,
    required this.pickCameraPressed,
    required this.pickGaleryPressed,
    this.label,
  });
  final String? label;
  final ProfileCubit cubit;
  final String? imageUrl;
  final XFile? pickedImage;
  final void Function()? pickGaleryPressed;
  final void Function()? pickCameraPressed;

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
              showDialog(
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
                          ))
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              height: 163,
              width: baseWidth,
              decoration: const BoxDecoration(
                color: Color(0xffF8F9FD),
              ),
              child: (pickedImage != null)
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 260,
                      width: double.infinity,
                      child: Image.file(
                        File(pickedImage?.path ?? ""),
                      ),
                    )
                  : imageUrl != null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageLoad(
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
                              child: Image.file(
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
}
