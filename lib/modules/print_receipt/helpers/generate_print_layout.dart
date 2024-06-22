import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/foundation.dart';
import 'package:pos/data/models/base/invoices.dart';
import 'package:pos/data/models/base/store.dart';
import 'package:pos/engine/configs/environment.dart';
import 'package:pos/engine/extensions/date_time.dart';
import 'package:pos/engine/extensions/int.dart';

class GeneratePrintLayout {
  Future<List<LineText>> generatePrintLayout(Invoices inv, Store store) async {
    final List<LineText> list = [];

    String base64Image = await convertImageUrlToBase64(
      Environment.showUrlImage(path: store.store?.storeImage ?? ''),
    );

    list.add(
      LineText(
        type: LineText.TYPE_TEXT,
        content: '--------------------------------',
        weight: 1,
        align: LineText.ALIGN_CENTER,
        linefeed: 1,
      ),
    );
    list.add(
      LineText(
        width: 100,
        height: 100,
        type: LineText.TYPE_IMAGE,
        content: base64Image,
        align: LineText.ALIGN_CENTER,
      ),
    );
    list.add(
      LineText(
        type: LineText.TYPE_TEXT,
        content: '--------------------------------',
        weight: 1,
        align: LineText.ALIGN_CENTER,
        linefeed: 1,
      ),
    );
    list.add(
      LineText(
        type: LineText.TYPE_TEXT,
        content: 'Merchant : ${store.store?.storeName ?? ''}',
        weight: 1,
        align: LineText.ALIGN_LEFT,
        fontZoom: 2,
        linefeed: 1,
        x: 45,
      ),
    );
    list.add(LineText(linefeed: 1));
    list.add(
      LineText(
        type: LineText.TYPE_TEXT,
        content: "Invoice : ${inv.invoiceLabel ?? ''}",
        weight: 1,
        align: LineText.ALIGN_LEFT,
        linefeed: 1,
        x: 45,
      ),
    );
    list.add(LineText(linefeed: 1));
    list.add(
      LineText(
        type: LineText.TYPE_TEXT,
        content:
            "Date & Time :  ${inv.paymentDate == null ? DateTime.now().format(pattern: 'dd MMM yyyy, HH:mm:ss') : DateTime.parse(inv.paymentDate).toddMMMyyyyHHmmss()}",
        weight: 1,
        align: LineText.ALIGN_LEFT,
        linefeed: 1,
        x: 45,
      ),
    );
    list.add(LineText(linefeed: 1));
    list.add(
      LineText(
        type: LineText.TYPE_TEXT,
        content: '--------------------------------',
        weight: 1,
        align: LineText.ALIGN_CENTER,
        linefeed: 1,
        x: 45,
      ),
    );
    list.add(
      LineText(
        type: LineText.TYPE_TEXT,
        content: 'Items',
        weight: 0,
        align: LineText.ALIGN_LEFT,
        x: 45,
        relativeX: 0,
        linefeed: 0,
      ),
    );
    list.add(
      LineText(
        type: LineText.TYPE_TEXT,
        content: 'Qty',
        weight: 0,
        align: LineText.ALIGN_LEFT,
        x: 245,
        relativeX: 0,
        linefeed: 0,
      ),
    );
    list.add(
      LineText(
        type: LineText.TYPE_TEXT,
        content: 'Price',
        weight: 0,
        align: LineText.ALIGN_LEFT,
        x: 295,
        relativeX: 0,
        linefeed: 1,
      ),
    );
    list.add(LineText(linefeed: 1));
    inv.product?.items?.map((e) {
      list.add(
        LineText(
          type: LineText.TYPE_TEXT,
          content: e.product!.name!.length > 16
              ? e.product?.name?.substring(0, 16)
              : e.product?.name,
          weight: 1,
          align: LineText.ALIGN_LEFT,
          relativeX: 0,
          y: 200,
          x: 45,
          linefeed: 0,
        ),
      );
      list.add(
        LineText(
          type: LineText.TYPE_TEXT,
          content: "${e.quantity}",
          align: LineText.ALIGN_LEFT,
          weight: 1,
          x: 245,
          relativeX: 0,
          linefeed: 0,
        ),
      );
      list.add(
        LineText(
          type: LineText.TYPE_TEXT,
          content: "${e.product?.price.currencyFormat(symbol: "Rp.")}",
          align: LineText.ALIGN_LEFT,
          weight: 1,
          x: 295,
          relativeX: 0,
          linefeed: 0,
        ),
      );
      list.add(LineText(linefeed: 1));
      list.add(LineText(linefeed: 1));
    }).toList();
    list.add(
      LineText(
        type: LineText.TYPE_TEXT,
        content: '--------------------------------',
        weight: 1,
        align: LineText.ALIGN_CENTER,
        linefeed: 1,
      ),
    );
    list.add(
      LineText(
        type: LineText.TYPE_TEXT,
        content: "Total Transaction",
        align: LineText.ALIGN_LEFT,
        weight: 1,
        x: 45,
        relativeX: 0,
        linefeed: 0,
      ),
    );
    list.add(
      LineText(
        type: LineText.TYPE_TEXT,
        content: inv.product!.totalPrice.currencyFormat(symbol: "Rp "),
        align: LineText.ALIGN_LEFT,
        weight: 1,
        x: 295,
        relativeX: 0,
        linefeed: 1,
      ),
    );
    list.add(
      LineText(
        type: LineText.TYPE_TEXT,
        content: '--------------------------------',
        weight: 1,
        align: LineText.ALIGN_CENTER,
        linefeed: 1,
      ),
    );
    list.add(LineText(linefeed: 1));
    list.add(LineText(linefeed: 1));
    return list;
  }

  Future<String> convertImageUrlToBase64(String imageUrl) async {
    print("ini imageurl");
    print(imageUrl);
    HttpClient httpClient = HttpClient();
    log(imageUrl);
    var request = await httpClient.getUrl(Uri.parse(imageUrl));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    return base64Encode(bytes);
  }
}
