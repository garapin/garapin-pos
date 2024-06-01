import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/data/models/base/invoices.dart';
import 'package:pos/engine/engine.dart';
import 'package:http/http.dart' as http;

class BluetoothPrintExample extends StatefulWidget {
  final String logoUrl;
  final String nameMerchant;
  final String noInvoices;
  final String date;
  final String totalPrice;
  final String paymentMethod;

  final List<Item> item;

  const BluetoothPrintExample(
      {super.key,
      required this.logoUrl,
      required this.noInvoices,
      required this.date,
      required this.item,
      required this.nameMerchant,
      required this.totalPrice,
      required this.paymentMethod});

  @override
  _BluetoothPrintExampleState createState() => _BluetoothPrintExampleState();
}

class _BluetoothPrintExampleState extends State<BluetoothPrintExample> {
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;

  bool _connected = false;
  BluetoothDevice? _device;
  String tips = 'No device connected';
  bool loading = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) => initBluetooth());
  }

  Future<void> initBluetooth() async {
    bluetoothPrint.startScan(timeout: Duration(seconds: 4));

    bool isConnected = await bluetoothPrint.isConnected ?? false;

    bluetoothPrint.state.listen((state) {
      print('Current device status: $state');
      switch (state) {
        case BluetoothPrint.CONNECTED:
          setState(() {
            _connected = true;
            tips = 'Connected successfully';
          });
          break;
        case BluetoothPrint.DISCONNECTED:
          setState(() {
            _connected = false;
            tips = 'Disconnected successfully';
          });
          break;
        default:
          break;
      }
    });

    if (!mounted) return;

    if (isConnected) {
      setState(() {
        _connected = true;
      });
    }
  }

  Future<String> convertImageUrlToBase64(String imageUrl) async {
    HttpClient httpClient = HttpClient();
    log(imageUrl);
    var request = await httpClient.getUrl(Uri.parse(imageUrl));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    return base64Encode(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                height: 50,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text(loading ? 'loading ...' : 'Print Receipt'),
                  onPressed: _connected
                      ? () async {
                          Map<String, dynamic> config = Map();
                          config['width'] = 60;
                          config['height'] = 70;
                          config['gap'] = 1;
                          config['fontSize'] = 10;

                          List<LineText> list = [];
                          String base64Image = await convertImageUrlToBase64(
                              Environment.showUrlImage(path: widget.logoUrl));
                          log(base64Image);
                          list.add(LineText(
                              type: LineText.TYPE_TEXT,
                              content: '--------------------------------',
                              weight: 1,
                              align: LineText.ALIGN_CENTER,
                              linefeed: 1));
                          list.add(LineText(
                            width: 100,
                            height: 100,
                            type: LineText.TYPE_IMAGE,
                            content: base64Image,
                            align: LineText.ALIGN_CENTER,
                          ));
                          list.add(LineText(
                              type: LineText.TYPE_TEXT,
                              content: '--------------------------------',
                              weight: 1,
                              align: LineText.ALIGN_CENTER,
                              linefeed: 1));
                          list.add(LineText(
                              type: LineText.TYPE_TEXT,
                              content: 'Merhcant : ${widget.nameMerchant}',
                              weight: 1,
                              align: LineText.ALIGN_LEFT,
                              fontZoom: 2,
                              linefeed: 1));
                          list.add(LineText(linefeed: 1));
                          list.add(LineText(
                              type: LineText.TYPE_TEXT,
                              content: "Invoice : ${widget.noInvoices}",
                              weight: 1,
                              align: LineText.ALIGN_LEFT,
                              linefeed: 1));
                          list.add(LineText(linefeed: 1));
                          list.add(LineText(
                              type: LineText.TYPE_TEXT,
                              content: "Ru Date & Time : ${widget.date}",
                              weight: 1,
                              align: LineText.ALIGN_LEFT,
                              linefeed: 1));
                          list.add(LineText(linefeed: 1));
                          list.add(LineText(
                              type: LineText.TYPE_TEXT,
                              content: '--------------------------------',
                              weight: 1,
                              align: LineText.ALIGN_CENTER,
                              linefeed: 1));
                          list.add(LineText(
                              type: LineText.TYPE_TEXT,
                              content: 'Items',
                              weight: 0,
                              align: LineText.ALIGN_LEFT,
                              x: 0,
                              relativeX: 0,
                              linefeed: 0));
                          list.add(LineText(
                              type: LineText.TYPE_TEXT,
                              content: 'Qty',
                              weight: 0,
                              align: LineText.ALIGN_LEFT,
                              x: 200,
                              relativeX: 0,
                              linefeed: 0));
                          list.add(LineText(
                              type: LineText.TYPE_TEXT,
                              content: 'Price',
                              weight: 0,
                              align: LineText.ALIGN_LEFT,
                              x: 250,
                              relativeX: 0,
                              linefeed: 1));
                          list.add(LineText(linefeed: 1));
                          widget.item.map((e) {
                            list.add(LineText(
                                type: LineText.TYPE_TEXT,
                                content: e.product!.name!.length > 16
                                    ? e.product?.name?.substring(0, 16)
                                    : e.product?.name,
                                weight: 1,
                                align: LineText.ALIGN_LEFT,
                                relativeX: 0,
                                y: 200,
                                linefeed: 0));
                            list.add(LineText(
                                type: LineText.TYPE_TEXT,
                                content: "${e.quantity}",
                                align: LineText.ALIGN_LEFT,
                                weight: 1,
                                x: 200,
                                relativeX: 0,
                                linefeed: 0));
                            list.add(LineText(
                                type: LineText.TYPE_TEXT,
                                content:
                                    "${e.product?.price.currencyFormat(symbol: "Rp.")}",
                                align: LineText.ALIGN_LEFT,
                                weight: 1,
                                x: 250,
                                relativeX: 0,
                                linefeed: 0));
                            list.add(LineText(linefeed: 1));
                            list.add(LineText(linefeed: 1));
                          }).toList();
                          list.add(LineText(
                              type: LineText.TYPE_TEXT,
                              content: '--------------------------------',
                              weight: 1,
                              align: LineText.ALIGN_CENTER,
                              linefeed: 1));
                          list.add(LineText(
                              type: LineText.TYPE_TEXT,
                              content: "Total Transaksi",
                              align: LineText.ALIGN_LEFT,
                              weight: 1,
                              x: 0,
                              relativeX: 0,
                              linefeed: 0));
                          list.add(LineText(
                              type: LineText.TYPE_TEXT,
                              content: widget.totalPrice,
                              align: LineText.ALIGN_LEFT,
                              weight: 1,
                              x: 250,
                              relativeX: 0,
                              linefeed: 1));
                          list.add(LineText(
                              type: LineText.TYPE_TEXT,
                              content: '--------------------------------',
                              weight: 1,
                              align: LineText.ALIGN_CENTER,
                              linefeed: 1));
                          list.add(LineText(
                              type: LineText.TYPE_TEXT,
                              content: "Payment Method:",
                              align: LineText.ALIGN_LEFT,
                              weight: 1,
                              x: 0,
                              relativeX: 0,
                              linefeed: 0));
                          list.add(LineText(
                              type: LineText.TYPE_TEXT,
                              content: widget.paymentMethod,
                              align: LineText.ALIGN_LEFT,
                              weight: 1,
                              x: 300,
                              relativeX: 0,
                              linefeed: 1));
                          list.add(LineText(linefeed: 1));

                          await bluetoothPrint.printReceipt(config, list);
                        }
                      : () async {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: StreamBuilder<List<BluetoothDevice>>(
                                  stream: bluetoothPrint.scanResults,
                                  initialData: [],
                                  builder: (c, snapshot) => Column(
                                    children: snapshot.data!
                                        .map((d) => ListTile(
                                              title: Text(d.name ?? ''),
                                              subtitle: Text(d.address ?? ''),
                                              onTap: () async {
                                                setState(() {
                                                  loading = true;
                                                  _device = d;
                                                });
                                                await bluetoothPrint
                                                    .connect(d)
                                                    .then((value) {
                                                  context.pop();
                                                  loading = false;
                                                });
                                              },
                                              trailing: _device != null &&
                                                      _device!.address ==
                                                          d.address
                                                  ? Icon(
                                                      Icons.check,
                                                      color: Colors.green,
                                                    )
                                                  : null,
                                            ))
                                        .toList(),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                ),
              )),
        ),
        SizedBox(width: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(loading ? "Loading .." : 'Disconnect'),
              onPressed: _connected
                  ? () async {
                      setState(() {
                        loading = true;
                        tips = 'Disconnecting...';
                        _device = null;
                      });
                      await bluetoothPrint.disconnect().then((value) {
                        loading = false;
                      });
                    }
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  Future<Uint8List> _getLogoBytes(String logoUrl) async {
    final response = await http.get(Uri.parse(logoUrl));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load logo');
    }
  }
}
