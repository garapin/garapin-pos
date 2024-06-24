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
      '${store.store?.address}, ${store.store?.city}, ${store.store?.postalCode}',
      styles: const PosStyles(
        align: PosAlign.center,
      ),
    );
    bytes += generator.text(
      '${store.store?.state}, ${store.store?.country}',
      styles: const PosStyles(
        align: PosAlign.center,
      ),
    );
    bytes += generator.text(
      'Phone: ${store.store?.phoneNumber}',
      styles: const PosStyles(
        align: PosAlign.center,
      ),
    );

    bytes += generator.feed(2);

    bytes += generator.row([
      PosColumn(
        text: 'No Invoice',
        width: 4,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: ':',
        width: 1,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: inv.invoiceLabel ?? '',
        width: 7,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.feed(1);

    bytes += generator.row([
      PosColumn(
        text: 'Tanggal',
        width: 4,
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
        width: 7,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.feed(1);

    bytes += generator.text(
      '--------------------------------',
      styles: const PosStyles(
        align: PosAlign.center,
      ),
    );

    bytes += generator.feed(1);

    inv.product?.items?.forEach((e) {
      int totalPriceItem = e.product!.price! * e.quantity! ?? 0;
      // Parent Item
      bytes += generator.row([
        PosColumn(
          text: e.quantity.toString(),
          width: 2,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: e.product!.name!.length > 16
              ? e.product!.name!.substring(0, 16)
              : e.product!.name!,
          width: 6,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: totalPriceItem.currencyFormat(symbol: "Rp."),
          width: 4,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);

      // Child Item
      bytes += generator.row([
        PosColumn(
          text: '',
          width: 2,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text:
              '${e.quantity}x ${e.product?.price.currencyFormat(symbol: "Rp.")}',
          width: 6,
          styles: const PosStyles(
            align: PosAlign.left,
            height: PosTextSize.size5,
            fontType: PosFontType.fontA,
          ),
        ),
        PosColumn(
          text: '',
          width: 4,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
      bytes += generator.feed(1);
    });

    bytes += generator.feed(2);

    bytes += generator.row([
      PosColumn(
        text: 'Subtotal',
        width: paperSize == 58 ? 7 : 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: inv.product!.totalPrice.currencyFormat(symbol: "Rp "),
        width: paperSize == 58 ? 5 : 6,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.feed(1);

    bytes += generator.row([
      PosColumn(
        text: 'Total',
        width: paperSize == 58 ? 7 : 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: inv.product!.totalPrice.currencyFormat(symbol: "Rp "),
        width: paperSize == 58 ? 5 : 6,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.text(
      '--------------------------------',
      styles: const PosStyles(
        align: PosAlign.center,
      ),
    );

    bytes += generator.feed(1);

    bytes += generator.row([
      PosColumn(
        text: 'Pembayaran',
        width: paperSize == 58 ? 4 : 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: paymentMethod,
        width: paperSize == 58 ? 8 : 6,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.feed(1);

    if (paymentMethod == 'Virtual Account') {
      bytes += generator.row([
        PosColumn(
          text: 'No.VA',
          width: paperSize == 58 ? 4 : 6,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: '${vaData?.accountNumber}',
          width: paperSize == 58 ? 8 : 6,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);

      bytes += generator.feed(1);

      bytes += generator.row([
        PosColumn(
          text: 'Merchant',
          width: paperSize == 58 ? 4 : 6,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: '${store.store?.storeName}',
          width: paperSize == 58 ? 8 : 6,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);

      bytes += generator.feed(1);

      bytes += generator.text(
        'Expired at ${vaData!.expirationDate!.toddMMMyyyyHHmmss()}',
        styles: const PosStyles(
          align: PosAlign.center,
        ),
      );

      bytes += generator.feed(3);
    }

    if (paymentMethod == 'QRIS') {

      bytes += generator.qrcode(qrData!.qrString!);

      bytes += generator.feed(1);

      bytes += generator.text(
        'Expired at ${qrData.expiresAt!.toddMMMyyyyHHmmss()}',
        styles: const PosStyles(
          align: PosAlign.center,
        ),
      );

      bytes += generator.feed(3);
    }

    bytes += generator.text(
      'Terima kasih',
      styles: const PosStyles(
        align: PosAlign.center,
      ),
    );

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
