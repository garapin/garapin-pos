import 'package:armory/engine/base/app.dart';
import 'package:armory/modules/auth/select_database/cubit/select_database_cubit.dart';
import 'package:armory/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../data/models/base/user.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/components/background_image.dart';
import '../../../../widgets/widgets.dart';

class SelectDatabasePage extends StatelessWidget {
  const SelectDatabasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SelectDatabaseCubit>();
    return BlocBuilder<SelectDatabaseCubit, SelectDatabaseState>(
      builder: (context, state) {
        return ContainerStateHandler(
          loading: const Center(
            child: CircularProgressIndicator(),
          ),
          status: state.status,
          child: BackgorundImageWidget(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 77,
                          width: 623,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(58),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(),
                                onPressed: () {
                                  context
                                      .pushNamed(RouteNames.createNewDatabase);
                                },
                                child: Text(
                                  "Create New Database",
                                  style: AppFont.whiteLarge(context),
                                )),
                          )),
                      const SizedBox(height: 32),
                      Container(
                        height: 518,
                        width: 623,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 90, vertical: 32),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 201, 201, 201),
                              offset: Offset(0, 0),
                              blurRadius: 2,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Existing Database",
                              style: AppFont.largeBold(context)!
                                  .copyWith(fontSize: 28),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              "Silahkan pilih database yang ingin digunakan",
                              style: AppFont.medium(context)!
                                  .copyWith(fontSize: 16),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              height: 260,
                              child: ListView.builder(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2, vertical: 2),
                                shrinkWrap: true,
                                itemCount:
                                    state.user?.storeDatabaseName?.length,
                                itemBuilder: (context, index) {
                                  var database =
                                      state.user?.storeDatabaseName?[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: CustomButton(
                                      onPressed: () {
                                        cubit.selectedDatabase(
                                            database?.name ?? "");
                                      },
                                      child: CardSelectDatabase(
                                        selected: database?.name ==
                                                state.selectedDatabase
                                            ? true
                                            : false,
                                        database: database,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 32),
                            SizedBox(
                                height: 48,
                                width: baseWidth,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(58),
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text("Load")))),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        height: 48,
                        width: 421,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(58),
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(58),
                              ),
                              side: BorderSide(
                                  color: AppColor
                                      .appColor.primary), // Warna garis outline
                            ),
                            child: const Text("Cancel"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CardSelectDatabase extends StatelessWidget {
  final bool selected;
  final StoreDatabaseName? database;

  const CardSelectDatabase({
    super.key,
    required this.selected,
    this.database,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        height: 78,
        width: 443,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: selected ? AppColor.appColor.primary : Colors.grey,
              offset: const Offset(0, 0),
              blurRadius: 0,
              spreadRadius: 2,
            ),
          ],
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  database?.name ?? "",
                  style: AppFont.largeBold(context)!.copyWith(
                      fontSize: 16,
                      color: selected ? AppColor.appColor.primary : null,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(height: 2),
                Text(
                  DateTime.now().toString(),
                  style: AppFont.large(context)!.copyWith(
                    fontSize: 14,
                    color: selected ? AppColor.appColor.primary : null,
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? AppColor.appColor.primary : Colors.grey,
                width: 3.0,
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(
                  Icons.check,
                  size: 30.0,
                  color: selected ? AppColor.appColor.primary : Colors.grey,
                )),
          ),
        ]),
      ),
    );
  }
}
