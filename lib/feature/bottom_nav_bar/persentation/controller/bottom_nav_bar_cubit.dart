import 'package:bookingapp/core/helpers/dependency_injection.dart';
import 'package:bookingapp/feature/events/persentation/screens/saved_events_screen.dart';
import 'package:bookingapp/feature/home/persentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_nav_bar_cubit.freezed.dart';

@freezed
class BottomNavBarState with _$BottomNavBarState {
  const factory BottomNavBarState.initial() = _Initial;
  const factory BottomNavBarState.changeIndexState() = ChangeIndexState;
}

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(const BottomNavBarState.initial());
  static BottomNavBarCubit get get => getIt();

  List<Widget> pages = [
     HomeScreen(),
    const SavedEventsScreen(),
    Container(),
    Container(),
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    emit(const BottomNavBarState.initial());
    currentIndex = index;
    emit(const BottomNavBarState.changeIndexState());
  }
}
