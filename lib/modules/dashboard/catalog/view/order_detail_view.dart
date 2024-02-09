import 'package:flutter/material.dart';

import '../../../../engine/base/app.dart';
import '../../../../resources/resources.dart';
import '../../../../themes/themes.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: baseHeight,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Orders Details",
                  style: AppFont.largeBold(context)!.copyWith(fontSize: 20),
                ),
                Text(
                  "Swipe kanan untuk hapus pesanan",
                  style: AppFont.medium(context)!.copyWith(
                      fontSize: 12, color: Colors.black.withOpacity(0.7)),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Resources.images.google.image(height: 50),
                              const SizedBox(width: 6),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Google food",
                                    style: AppFont.largeBold(context),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    "price",
                                    style: AppFont.small(context)!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  Text(
                                    "12000",
                                    style: AppFont.largePrimary(context),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 219, 219, 219),
                                        shape: BoxShape.circle),
                                    child: const Center(
                                        child: Icon(
                                      Icons.remove,
                                      weight: 4,
                                    )),
                                  ),
                                  const SizedBox(width: 6),
                                  const Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle),
                                    child: const Center(
                                        child: Icon(
                                      color: Colors.white,
                                      Icons.add,
                                      weight: 4,
                                    )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Divider(thickness: 2),
                        const SizedBox(height: 4),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
