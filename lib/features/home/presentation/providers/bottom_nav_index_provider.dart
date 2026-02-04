import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavIndexProvider = NotifierProvider<BottomNavIndexNotifier, int>(
  () {
    return BottomNavIndexNotifier();
  },
);

class BottomNavIndexNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}
