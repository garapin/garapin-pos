import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thermal_printer/thermal_printer.dart';

enum BluetoothPrintState {
  initial,
  scanning,
  scanningComplete,
  deviceSelected,
  printing,
  completed,
  error
}

class BluetoothPrintCubit extends Cubit<BluetoothPrintState> {
  BluetoothPrintCubit() : super(BluetoothPrintState.initial);
  var printerManager = PrinterManager.instance;
  List<PrinterDevice>? devices = [];
  PrinterDevice? selectedDevice;

  void startScan() async {
    devices = [];
    emit(BluetoothPrintState.scanning);

    // Find printers
    PrinterManager.instance
        .discovery(type: PrinterType.bluetooth, isBle: true)
        .listen((device) {
      devices?.add(device);
      emit(BluetoothPrintState.scanningComplete);
    });
  }

  void selectDevice(PrinterDevice device) async {
    // Stop scanning when a device is selected
    selectedDevice = device;

    PrinterManager.instance.stateBluetooth.listen((status) {
      print(' ----------------- status bt $status ------------------ ');
    });
    emit(BluetoothPrintState.deviceSelected);
  }

  void disconnect() async {
    await PrinterManager.instance.disconnect(type: PrinterType.bluetooth);
    selectedDevice = null;
    emit(BluetoothPrintState.initial);
  }

  Future<void> printReceipt(List<int> byteData, int paperSize) async {
    emit(BluetoothPrintState.printing);

    try {
      bool connected = await PrinterManager.instance.connect(
        type: PrinterType.bluetooth,
        model: BluetoothPrinterInput(
          name: selectedDevice?.name,
          address: selectedDevice!.address!,
          isBle: false,
          autoConnect: false,
        ),
      );

      if (connected) {
        Future.delayed(const Duration(milliseconds: 1000), () {
          PrinterManager.instance.send(
            type: PrinterType.bluetooth,
            bytes: byteData,
          );
        });
        emit(BluetoothPrintState.completed);
      } else {
        emit(BluetoothPrintState.error);
      }
    } catch (e) {
      emit(BluetoothPrintState.error);
      print(e.toString()); // Ganti dengan penanganan error yang lebih baik
    }
  }
}
