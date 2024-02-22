import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/cart/cubit/cart_cubit.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/widgets.dart';

class SummaryOrderWidget extends StatelessWidget {
  const SummaryOrderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return ContainerStateHandler(
          status: state.status,
          loading: SizedBox(),
          child: Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sub Total',
                      style: AppFont.large(context)!
                          .copyWith(color: Colors.grey, fontSize: 20),
                    ),
                    Text(
                      state.cart?.totalPrice.currencyFormat(symbol: 'Rp.') ??
                          "",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 40,
                  width: baseWidth,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: ElevatedButton(
                      onPressed: () {
                        if (state.cart?.totalPrice == 0) {
                          ShowNotify.error(context,
                              msg: "belum ada produk yang akan di checkout");
                        }
                      },
                      child: Text('Checkout', style: TextStyle(fontSize: 16)),
                    ),
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
