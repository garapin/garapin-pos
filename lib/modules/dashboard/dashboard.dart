import 'package:go_router/go_router.dart';
import 'package:pos/engine/base/app.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/dashboard/cubit/dashboard_cubit.dart';
import 'package:pos/modules/dashboard/profile/cubit/profile_cubit.dart';
import 'package:pos/resources/resources.dart';
import 'package:pos/routes/routes.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/widgets.dart';
import 'catalog/view/catalog.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DashboardCubit>();
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return ContainerStateHandler(
          status: DataStateStatus.success,
          loading: const SizedBox(),
          child: Scaffold(
            appBar: AppBar(
              title:
                  Text(state.store?.store?.storeName ?? "Lengkapin profile!"),
              actions: const [
                ActionAppBar(),
              ],
            ),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<DashboardCubit, DashboardState>(
                  builder: (context, state) {
                    return ContainerStateHandler(
                      status: state.status,
                      loading: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        width: baseWidth * 0.09,
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            CustomButton(
                                onPressed: () {
                                  cubit.changePage(0);
                                },
                                child: state.index == 0
                                    ? Resources.images.catalogActive.image()
                                    : Resources.images.catalogInactive.image()),
                            const SizedBox(height: 8),
                            CustomButton(
                                onPressed: () {
                                  cubit.changePage(1);
                                },
                                child: state.index == 1
                                    ? Resources.images.reportActive.image()
                                    : Resources.images.reportInactive.image()),
                            const SizedBox(height: 8),
                            CustomButton(
                                onPressed: () {
                                  cubit.changePage(2);
                                },
                                child: state.index == 2
                                    ? Resources.images.profileActive.image()
                                    : Resources.images.profileInactive.image()),
                            const Spacer(),
                            CustomButton(
                                onPressed: () {
                                  Sessions.clear().then(
                                      (value) => context.go(RouteNames.root));
                                },
                                child: const Icon(
                                  Icons.logout,
                                  size: 40,
                                  color: Colors.red,
                                )),
                            const SizedBox(height: 40)
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: baseWidth * 0.91,
                  child: BlocBuilder<DashboardCubit, DashboardState>(
                    builder: (context, state) {
                      return ContainerStateHandler(
                          loading: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          status: state.status,
                          child: state.widget);
                    },
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
