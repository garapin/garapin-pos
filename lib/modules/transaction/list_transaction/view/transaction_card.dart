import 'package:armory/data/models/base/transaction.dart';
import 'package:armory/engine/engine.dart';
import 'package:armory/engine/helpers/color_status.dart';
import 'package:armory/themes/themes.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final Transaction? data;
  const TransactionCard({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: baseWidth,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data?.noSuratJalan ?? "-",
                    style: AppFont.mediumBold(context),
                  ),
                  Text(
                    data?.created?.toddMMMyyyyHHmm() ?? "-",
                    style: AppFont.small(context),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                    color: statusTransactionColor(data?.statusTransaction ?? "")
                        .withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  data?.statusTransaction ?? "-",
                  style: AppFont.smallBold(context)!.copyWith(
                      color: statusTransactionColor(
                          data?.statusTransaction ?? "")),
                ),
              ),
            ],
          ),
          const Divider(thickness: 1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data?.transactionPurpose ?? "-",
                style: AppFont.largeBold(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                "Total Barang : ${data?.quantity ?? "-"}",
                style: AppFont.mediumPrimary(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Text(
                data?.notes ?? "-",
                style: AppFont.small(context),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )
        ],
      ),
    );
  }
}
