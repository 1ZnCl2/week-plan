import 'package:flutter_riverpod/flutter_riverpod.dart';

class SliderProvider extends StateNotifier<bool> {
  SliderProvider() : super(false);

  void toggleSlider() {
    state = !state;
  }
}

final sliderProvider =
    StateNotifierProvider<SliderProvider, bool>((ref) => SliderProvider());
