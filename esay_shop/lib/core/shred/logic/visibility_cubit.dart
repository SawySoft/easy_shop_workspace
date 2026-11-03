import 'package:flutter_bloc/flutter_bloc.dart';

class VisibilityCubit extends Cubit<bool> {
  VisibilityCubit() : super(false);

  void toggleVisibility() => emit(!state);
}
