import 'package:intl/intl.dart';

enum ViewState { idle, busy, error, noConnection }

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';
  String get allInCaps => toUpperCase();
  String get capitalize =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  String get capitalizeFirstofEach =>
      split(" ").map((str) => str.capitalize).join(" ");
}

extension Time on String {
  DateTime get stringToDateTime {
    final format = DateFormat("h:mm a"); //"6:00 AM"

    return format.parse(this);
  }
}


// DateFormat('HH:mm').format(widget.message.createdAt!),
// DateFormat('dd MMMM, yyyy').format(message.metadata!.dueDate!),
// DateFormat('hh:mm a').format(message.metadata!.dueDate!),
// DateFormat.yMMMd().format(message.createdAt!),
// DateFormat('yyyy-MM-dd').format(_selectedDate!.value),