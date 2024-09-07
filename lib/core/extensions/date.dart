import 'package:intl/intl.dart';

extension ExtensionDateTIme on DateTime {
  String get parsedDate => DateFormat('yyyy-MM-dd').format(this);

  String get parsedTime => DateFormat('hh : mm aa').format(this);
  String get parseUnZonedTime => DateFormat('hh : mm').format(this);
}
