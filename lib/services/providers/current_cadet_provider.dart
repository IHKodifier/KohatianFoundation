import 'package:kohatian_foundation/models/cadet_model.dart';
import 'package:kohatian_foundation/widget_export.dart';

final currentCadetProvider =
    StateNotifierProvider<CadetStateNotifier, Cadet?>((ref) {
  return CadetStateNotifier();
});

class CadetStateNotifier extends StateNotifier<Cadet?> {
  CadetStateNotifier() : super(null);

  void setCurrentCadet(Cadet cadet) {
    state = cadet;
  }

  void clearCurrentCadet() {
    state = null;
  }
}
