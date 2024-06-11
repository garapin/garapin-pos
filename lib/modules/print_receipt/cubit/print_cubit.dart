import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum BluetoothPrintState { initial, scanning, scanningComplete, deviceSelected, printing, completed, error }

class BluetoothPrintCubit extends Cubit<BluetoothPrintState> {
  BluetoothPrintCubit() : super(BluetoothPrintState.initial);
  final BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  List<BluetoothDevice>? devices = [];
  BluetoothDevice? selectedDevice;

  void startScan() async {
    emit(BluetoothPrintState.scanning);
    bluetoothPrint.startScan(timeout: const Duration(seconds: 4));

    bluetoothPrint.scanResults.listen((List<BluetoothDevice> results) {
      devices = results;// Update state to refresh UI with the list of devices
      emit(BluetoothPrintState.scanningComplete);
    });
  }

  void selectDevice(BluetoothDevice device) {
    bluetoothPrint.stopScan(); // Stop scanning when a device is selected
    selectedDevice = device;
    emit(BluetoothPrintState.deviceSelected);
  }

  void disconnect() {
    bluetoothPrint.disconnect();
    selectedDevice = null;
    emit(BluetoothPrintState.initial);
  }

  Future<void> printReceipt(List<LineText> data, int paperSize) async {
    emit(BluetoothPrintState.printing);

    Map<String, dynamic> config = {};
    config['width'] = paperSize;
    config['height'] = 70;
    config['gap'] = 1;
    config['fontSize'] = 10;

    for (var line in data) {
      print("${line.content}");
    }

    try {
      bool connected = await bluetoothPrint.connect(selectedDevice!);
      if (connected) {
        await bluetoothPrint.printReceipt(config, data);
        emit(BluetoothPrintState.completed);
        bluetoothPrint.disconnect();
      } else {
        emit(BluetoothPrintState.error);
      }
    } catch (e) {
      emit(BluetoothPrintState.error);
      print(e.toString()); // Ganti dengan penanganan error yang lebih baik
    }
  }
}
