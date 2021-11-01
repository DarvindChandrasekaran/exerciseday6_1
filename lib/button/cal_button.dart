import 'package:flutter_bloc/flutter_bloc.dart';

class DearFeatureCubit extends Cubit<int> {
  DearFeatureCubit() : super(0);

  void increment() {
    emit(state + 1);
    print(state);
  }

  void decrement() {
    emit(state - 1);
    print(state);
  }
}
