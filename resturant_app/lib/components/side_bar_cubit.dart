import 'package:flutter_bloc/flutter_bloc.dart';

class SidebarCubit extends Cubit<int> {
  SidebarCubit() : super(0);

  void selectIndex(int index) => emit(index);
}
