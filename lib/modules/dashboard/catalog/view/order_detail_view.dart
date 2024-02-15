import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pos/data/models/base/cart.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/cart/cubit/cart_cubit.dart';
import 'package:pos/widgets/widgets.dart';

import '../../../../engine/base/app.dart';
import '../../../../resources/resources.dart';
import '../../../../themes/themes.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: ContainerStateHandler(
              loading: const SizedBox(),
              status: state.status,
              child: Container(
                height: baseHeight,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Orders Details",
                        style:
                            AppFont.largeBold(context)!.copyWith(fontSize: 20),
                      ),
                      Text(
                        "Swipe kanan untuk hapus pesanan",
                        style: AppFont.medium(context)!.copyWith(
                            fontSize: 12, color: Colors.black.withOpacity(0.7)),
                      ),
                      const SizedBox(height: 20),
                      (state.cart!.items!.isEmpty)
                          ? Column(
                              children: [
                                SizedBox(height: 200),
                                SizedBox(
                                    width: double.infinity,
                                    child: Center(
                                        child: Text(
                                      "Keranjang Kosong",
                                      style: AppFont.largeBold(context)!
                                          .copyWith(color: Colors.grey),
                                    ))),
                              ],
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.cart?.items?.length,
                              itemBuilder: (context, index) {
                                var product = state.cart?.items?[index];
                                return Slidable(
                                  endActionPane: ActionPane(
                                    motion: ScrollMotion(),
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            cubit.removeFromCart(
                                                qty: -product!.quantity!,
                                                idProduct:
                                                    product.product!.id!);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 24,
                                          )),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          ImageLoad(
                                            imageUrl: Environment.showUrlImage(
                                                path: product?.product?.image ??
                                                    ""),
                                            height: 50,
                                            width: 80,
                                            fit: BoxFit.contain,
                                          ),
                                          const SizedBox(width: 6),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product?.product?.name ?? "",
                                                style:
                                                    AppFont.largeBold(context),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                "Harga",
                                                style: AppFont.small(context)!
                                                    .copyWith(
                                                        color: Colors.grey),
                                              ),
                                              Text(
                                                (int.parse(product
                                                                ?.product?.price
                                                                .toString() ??
                                                            "0") -
                                                        int.parse(product
                                                                ?.product
                                                                ?.discount
                                                                .toString() ??
                                                            "0"))
                                                    .currencyFormat()
                                                    .toString(),
                                                style: AppFont.largePrimary(
                                                    context),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              InkWell(
                                                onTap: () {
                                                  cubit.removeFromCart(
                                                      idProduct: product!
                                                          .product!.id!);
                                                },
                                                child: Container(
                                                  height: 45,
                                                  width: 45,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color:
                                                              Color.fromARGB(
                                                                  255,
                                                                  219,
                                                                  219,
                                                                  219),
                                                          shape:
                                                              BoxShape.circle),
                                                  child: const Center(
                                                      child: Icon(
                                                    Icons.remove,
                                                    weight: 4,
                                                  )),
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Text(
                                                product?.quantity.toString() ??
                                                    "0",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(width: 12),
                                              InkWell(
                                                onTap: () {
                                                  cubit.addToCart(
                                                      idProduct: product!
                                                          .product!.id!);
                                                },
                                                child: Container(
                                                  height: 45,
                                                  width: 45,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.black,
                                                          shape:
                                                              BoxShape.circle),
                                                  child: const Center(
                                                      child: Icon(
                                                    color: Colors.white,
                                                    Icons.add,
                                                    weight: 4,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      const Divider(thickness: 2),
                                      const SizedBox(height: 4),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
