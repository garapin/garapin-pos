import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart';
import 'package:pos/data/models/base/invoices.dart';
import 'package:pos/data/models/base/qrcode.dart' as qr_model;
import 'package:pos/data/models/base/store.dart';
import 'package:pos/data/models/base/virtual_account.dart';
import 'package:pos/engine/configs/environment.dart';
import 'package:pos/engine/extensions/date_time.dart';
import 'package:pos/engine/extensions/int.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratePrintLayout {
  Future<List<int>> generateCheckoutPrintLayout(
    Invoices inv,
    Store store,
    String paymentMethod,
    qr_model.QrCode? qrData,
    VirtualAccount? vaData,
    int paperSize,
  ) async {

    /// Ini Paper SIZE
    print("Paper size $paperSize");
    /// SET PAPER SIZE
    final profile = await CapabilityProfile.load();
    final generator = Generator(
      paperSize == 58 ? PaperSize.mm58 : PaperSize.mm80,
      profile,
    );

    final ByteData data = await rootBundle.load('assets/images/google.png');

    final Uint8List imgBytes = data.buffer.asUint8List();
    final Image? image = decodeImage(imgBytes);

    List<int> bytes = [];

    // bytes += generator.text(
    //   '--------------------------------',
    //   styles: const PosStyles(
    //     align: PosAlign.center,
    //   ),
    // );
    // bytes += generator.image(image!);
    bytes += generator.text(
      '--------------------------------',
      styles: const PosStyles(
        align: PosAlign.center,
      ),
    );

    bytes += generator.row([
      PosColumn(
        text: 'Merchant',
        width: 5,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: ':',
        width: 1,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: store.store?.storeName ?? '',
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);

    bytes += generator.feed(1);

    bytes += generator.row([
      PosColumn(
        text: 'Invoice',
        width: 5,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: ':',
        width: 1,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: inv.invoiceLabel ?? '',
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);

    bytes += generator.feed(1);

    bytes += generator.row([
      PosColumn(
        text: 'Date & Time',
        width: 5,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: ':',
        width: 1,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: inv.paymentDate == null
            ? DateTime.now().format(pattern: 'dd MMM yyyy, HH:mm:ss')
            : DateTime.parse(inv.paymentDate).toddMMMyyyyHHmmss(),
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);

    bytes += generator.feed(1);

    bytes += generator.text(
      '--------------------------------',
      styles: const PosStyles(
        align: PosAlign.center,
      ),
    );

    bytes += generator.row([
      PosColumn(
        text: 'Items',
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: 'QTY',
        width: 2,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: 'Price',
        width: 4,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);

    inv.product?.items?.forEach((e) {
      bytes += generator.row([
        PosColumn(
          text: e.product!.name!.length > 16
              ? e.product!.name!.substring(0, 16)
              : e.product!.name!,
          width: 6,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: e.quantity.toString(),
          width: 2,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: '${e.product?.price.currencyFormat(symbol: "Rp.")}',
          width: 4,
          styles: const PosStyles(align: PosAlign.left),
        ),
      ]);
    });

    bytes += generator.feed(1);

    bytes += generator.text(
      '--------------------------------',
      styles: const PosStyles(
        align: PosAlign.center,
      ),
    );

    bytes += generator.row([
      PosColumn(
        text: 'Total Transaction',
        width: paperSize == 58 ? 7 : 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: inv.product!.totalPrice.currencyFormat(symbol: "Rp "),
        width: paperSize == 58 ? 5 : 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);

    bytes += generator.row([
      PosColumn(
        text: 'Payment Method',
        width: paperSize == 58 ? 7 : 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: paymentMethod,
        width: paperSize == 58 ? 5 : 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);

    bytes += generator.feed(1);

    bytes += generator.text(
      '--------------------------------',
      styles: const PosStyles(
        align: PosAlign.center,
      ),
    );

    if (paymentMethod == 'Virtual Account') {
      bytes += generator.text(
        'Pembayaran Virtual Account',
        styles: const PosStyles(
          align: PosAlign.center,
        ),
      );

      bytes += generator.feed(1);

      bytes += generator.text(
        '${vaData?.accountNumber}',
        styles: const PosStyles(
          align: PosAlign.center,
          bold: true,
          height: PosTextSize.size2,
        ),
      );

      bytes += generator.feed(1);

      bytes += generator.text(
        'Expired at ${vaData!.expirationDate!.toddMMMyyyyHHmmss()}',
        styles: const PosStyles(
          align: PosAlign.center,
        ),
      );
    }

    if (paymentMethod == 'QRIS') {
      bytes += generator.text(
        'Pembayaran QRIS',
        styles: const PosStyles(
          align: PosAlign.center,
        ),
      );

      bytes += generator.feed(1);

      bytes += generator.qrcode(qrData!.qrString!);

      bytes += generator.feed(1);

      bytes += generator.text(
        'Scan untuk lakukan pembayaran',
        styles: const PosStyles(
          align: PosAlign.center,
        ),
      );

      bytes += generator.text(
        'Expired at ${qrData.expiresAt!.toddMMMyyyyHHmmss()}',
        styles: const PosStyles(
          align: PosAlign.center,
        ),
      );
    }

    bytes += generator.cut();
    return bytes;
  }

  Future<Uint8List> loadImageFromUrl(String imageUrl) async {
    HttpClient httpClient = HttpClient();
    log(imageUrl);
    var request = await httpClient.getUrl(Uri.parse(imageUrl));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    return bytes;
  }
}
