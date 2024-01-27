import 'package:abditrack_inventory/engine/engine.dart';
import 'package:abditrack_inventory/modules/profile/cubit/profile_cubit.dart';
import 'package:abditrack_inventory/routes/routes.dart';
import 'package:abditrack_inventory/themes/themes.dart';
import 'package:abditrack_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return ContainerStateHandler(
            status: state.status,
            loading: const Center(
              child: CircularProgressIndicator(),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          backgroundColor: AppColor.appColor.primary,
                          child: Text(
                            state.user?.username?[0].toUpperCase() ?? "",
                            style: AppFont.whiteLarge(context)
                                ?.copyWith(fontSize: 50),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Text(
                              state.user?.username?.toUpperCase() ?? "",
                              style: AppFont.largeBold(context)
                                  ?.copyWith(fontSize: 16),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              state.user?.email ?? "",
                              style: AppFont.large(context)
                                  ?.copyWith(fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              state.user?.role?.toLowerCase() ?? "",
                              style: AppFont.large(context)
                                  ?.copyWith(fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 35),
                  ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    tileColor: Colors.grey.withOpacity(0.1),
                    onTap: () {},
                    title: Text(
                      "Syarat & ketentuan",
                      style: AppFont.large(context),
                    ),
                    trailing: const Icon(Icons.safety_check),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    tileColor: Colors.grey.withOpacity(0.1),
                    onTap: () {},
                    title: Text(
                      "Tentang Armory",
                      style: AppFont.large(context),
                    ),
                    trailing: const Icon(Icons.info),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    tileColor: Colors.grey.withOpacity(0.1),
                    onTap: () {
                      Sessions.clear().then((value) {
                        context.go(RouteNames.root);
                      });
                    },
                    title: Text(
                      "Keluar",
                      style: AppFont.large(context),
                    ),
                    trailing: const Icon(Icons.logout),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Versi ${state.version}",
                      style: AppFont.largeBold(context),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
