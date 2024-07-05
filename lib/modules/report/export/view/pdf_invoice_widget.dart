import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:pos/engine/engine.dart';

import '../../../../data/models/base/invoices.dart';
import '../../cubit/detail_transaction_product_cubit.dart';
import '../../cubit/report_detail_cubit.dart';
import 'pdf_widget.dart';

class PdfInvoiceWidget {
  static Future<File?> generate({
    DetailTransactionProductState? detailTransaction,
    ReportDetailState? reportDetail,
  }) async {
    final pdf = pw.Document();

    if (detailTransaction != null) {
      pdf.addPage(MultiPage(
        pageFormat: PdfPageFormat.a4,
        theme: pw.ThemeData.base(),
        build: (pw.Context context) => [
          buildHeader(detailTransaction.invoice, detailTransaction.trxName),
          SizedBox(height: 3 * PdfPageFormat.cm),
          buildTitle(),
          buildInvoice(detailTransaction.invoice),
          Divider(),
          buildTotal(detailTransactionInvoice: detailTransaction),
        ],
        footer: (context) => buildFooter(),
      ));

      return PdfWidget.saveDocument(
        name: '${detailTransaction.invoice?.invoiceLabel}.pdf',
        pdf: pdf,
      );
    } else if (reportDetail != null) {
      pdf.addPage(MultiPage(
        pageFormat: PdfPageFormat.a4,
        theme: pw.ThemeData.base(),
        build: (pw.Context context) => [
          buildHeader(reportDetail.invoice, reportDetail.trxName),
          SizedBox(height: 3 * PdfPageFormat.cm),
          buildTitle(),
          buildInvoice(reportDetail.invoice),
          Divider(),
          buildTotal(reportDetailInvoice: reportDetail),
        ],
        footer: (context) => buildFooter(),
      ));

      return PdfWidget.saveDocument(
        name: '${reportDetail.invoice?.invoiceLabel}.pdf',
        pdf: pdf,
      );
    }
    return null;
  }

  static Widget buildHeader(Invoices? invoices, String? trxName) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildAppAddress(),
              Container(
                height: 50,
                width: 50,
                child: BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  data: invoices?.invoiceLabel ?? '',
                ),
              ),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCustomerAddress(trxName),
              buildInvoiceInfo(invoices),
            ],
          ),
        ],
      );

  static Widget buildCustomerAddress(String? trxName) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            trxName.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );

  static Widget buildInvoiceInfo(Invoices? info) {
    // final paymentTerms = '${info.dueDate.difference(info.date).inDays} days';
    final titles = <String>[
      'Invoice Number:',
      'Invoice Date:',
      'Payment Method:',
    ];
    final data = <String>[
      info?.invoiceLabel ?? '',
      info?.createdAt != null ? info!.createdAt!.toddMMMyyyyHHmm() : '',
      info?.paymentMethod ?? '',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return buildText(title: title, value: value, width: 240);
      }),
    );
  }

  static Widget buildAppAddress() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('BagiBagiPOS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(
              'Jl. Letjen S.Parman Kav. 22-24, 5th Fl Unit F\nGrand Slipi Tower, Jakarta, Barat 11480, ID'),
        ],
      );

  static Widget buildTitle() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INVOICE',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          // Text('description'),
          // SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildInvoice(Invoices? invoice) {
    final headers = ['Nama', 'Kuantitas', 'Harga', 'Diskon', 'Total Harga'];

    // Safely handle null and ensure data is a non-nullable list of lists
    final data = invoice?.product?.items?.map((item) {
          final name = item.product?.name;
          final quantity = item.quantity;
          final unitPrice =
              item.product?.price.currencyFormat(symbol: "Rp.") ?? "";
          final String discount =
              item.product?.discount.currencyFormat(symbol: "Rp.") ?? "";
          final String total =
              ((item.product!.price! - item.product!.discount!) *
                      item.quantity!)
                  .toString()
                  .currencyDot(symbol: "Rp.");

          return [
            name,
            quantity,
            unitPrice,
            discount,
            total,
          ];
        }).toList() ??
        [];

    return pw.TableHelper.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
      headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: pw.Alignment.center,
        1: pw.Alignment.center,
        2: pw.Alignment.center,
        3: pw.Alignment.center,
        4: pw.Alignment.center,
      },
    );
  }

  static Widget buildTotal({
    DetailTransactionProductState? detailTransactionInvoice,
    ReportDetailState? reportDetailInvoice,
  }) {
    int fee = 0;
    int tax = 0;
    int netTotal = 0;
    String totalAmount = '';

    if (detailTransactionInvoice != null && reportDetailInvoice == null) {
      fee = int.parse(detailTransactionInvoice.fee ?? "0");
      tax = int.parse(detailTransactionInvoice.tax ?? "0");
      netTotal = detailTransactionInvoice.invoice!.product!.totalPrice!;
      totalAmount =
          (detailTransactionInvoice.invoice!.product!.totalPrice! - fee - tax)
              .currencyFormat(symbol: "Rp.");
    } else if (detailTransactionInvoice == null &&
        reportDetailInvoice != null) {
      fee = int.parse(reportDetailInvoice.fee ?? "0");
      tax = int.parse(reportDetailInvoice.tax ?? "0");
      netTotal = reportDetailInvoice.invoice!.product!.totalPrice!;
      totalAmount =
          (reportDetailInvoice.invoice!.product!.totalPrice! - fee - tax)
              .currencyFormat(symbol: "Rp.");
    }

    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'Net Total',
                  value: netTotal.toString().currencyDot(symbol: 'Rp.'),
                  unite: true,
                ),
                buildText(
                  title: 'Fee Bank',
                  value: fee.toString().currencyDot(symbol: "Rp."),
                  unite: true,
                ),
                buildText(
                  title: 'Tax',
                  value: tax.toString().currencyDot(symbol: "Rp."),
                  unite: true,
                ),
                Divider(),
                buildText(
                  title: 'Total Amount',
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  value: totalAmount,
                  unite: true,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildFooter() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          Text("BagiBagiPOS"),
          SizedBox(height: 1.4 * PdfPageFormat.mm),
          Text(
            "Jl. Letjen S.Parman Kav. 22-24, 5th Fl Unit F\nGrand Slipi Tower, Jakarta, Barat 11480, ID",
            textAlign: pw.TextAlign.center,
          ),
        ],
      );

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}
