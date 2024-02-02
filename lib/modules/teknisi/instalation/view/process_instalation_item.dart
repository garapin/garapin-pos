import 'dart:io';
import 'package:armory/modules/teknisi/instalation/cubit/process_instalation_item_cubit.dart';
import 'package:armory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../engine/base/app.dart';
import '../../../../engine/helpers/color_status.dart';
import '../../../../themes/themes.dart';
import '../../../create_product/view/create_product.dart';

class ProcessInstalationItem extends StatelessWidget {
  const ProcessInstalationItem({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProcessInstalationItemCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pasang"),
      ),
      body:
          BlocBuilder<ProcessInstalationItemCubit, ProcessInstalationItemState>(
        builder: (context, state) {
          return ContainerStateHandler(
            refresherOptions: cubit.defaultRefresh,
            status: state.status,
            loading: const Center(
              child: CircularProgressIndicator(),
            ),
            child: FormBuilder(
              key: cubit.formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const Column(
                    children: [
                      SizedBox(height: 20),
                      OutlineTextField(
                        hintText: 'Masukan Nama Kendaraan',
                        name: 'vehicle_name',
                        label: 'Nama Kendaraan',
                      ),
                      SizedBox(height: 20),
                      OutlineTextField(
                        typeInput: TextInputType.number,
                        hintText: 'Masukan Nomor Lambung',
                        name: 'vehicle_no',
                        label: 'Nomor Lambung',
                      ),
                      SizedBox(height: 20),
                      OutlineTextField(
                        typeInput: TextInputType.number,
                        hintText: 'Masukan Odo Meter',
                        name: 'odo_meter',
                        label: 'Odo Meter',
                      ),
                      SizedBox(height: 20),
                      OutlineTextField(
                        typeInput: TextInputType.number,
                        hintText: 'Masukan Memory yang digunakan',
                        name: 'memory',
                        label: 'Memory (*GB)',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text("Device yang akan dipasang",
                      style: AppFont.largeBold(context)),
                  SizedBox(height: 4),
                  SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.item.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: statusItemColor(state
                                          .item[index].status!
                                          .toUpperCase())),
                                  child: Text(
                                    (index + 1).toString(),
                                    style: AppFont.whiteLarge(context),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.item[index].noProduct ?? "",
                                      style: AppFont.largeBold(context),
                                    ),
                                    SizedBox(
                                      width: baseWidth * 0.6,
                                      child: Text(
                                        "IMEI ${state.item[index].imei} | SN ${state.item[index].noSn}",
                                        style: AppFont.medium(context),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  height: 30,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(32),
                                      color: statusItemColor(state
                                          .item[index].status!
                                          .toUpperCase())),
                                  child: Center(
                                      child: Text(
                                          state.item[index].status
                                                  ?.toUpperCase() ??
                                              "",
                                          style: AppFont.whiteLarge(context)!
                                              .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.appColor.background,
                                          ))),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    onPressed: () {
                      cubit.formKey.currentState!.save();
                      cubit.pickImage();
                    },
                    child: Container(
                      width: baseWidth,
                      height: 160.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 193, 193, 193),
                        border: Border.all(
                          color: const Color.fromARGB(
                              221, 103, 100, 100), // Warna outline lebih gelap
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.photo,
                          size: 80.0,
                          color: Colors.white, // Warna ikon
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  (state.pickedImage.isEmpty)
                      ? SizedBox()
                      : SizedBox(
                          width: baseWidth,
                          height: 120,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 8);
                            },
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: state.pickedImage.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.file(
                                  File(state.pickedImage[index]
                                      .path), // Tutup kurung kurawal
                                  fit: BoxFit.contain,
                                  height: 120,
                                ),
                              );
                            },
                          ),
                        ),
                  const SizedBox(height: 30),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(),
                            onPressed: () {
                              cubit.doSubmit();
                            },
                            child: const Text("Simpan"))),
                  ),
                  SizedBox(height: 50)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
