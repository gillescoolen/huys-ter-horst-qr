import 'package:meta/meta.dart';

class HistoryItem {
  final String title;

  const HistoryItem(
    @required this.title,
  ) : assert(title != null);
}
