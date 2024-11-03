import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/utils/app_sessions.dart';
import '../state/home_screen_state.dart';

final homeScreenProvider =
    StateNotifierProvider<HomeControllerStateNotifier, HomeScreenState>((ref) => HomeControllerStateNotifier());

class HomeControllerStateNotifier extends StateNotifier<HomeScreenState> {
  HomeControllerStateNotifier()
      : super(HomeScreenState(
        name: "",
        todoBox: Hive.box(AppSessions.todoBox),
          tasks: [],
          loading: false,
        ));

    Future<String>? getUsername() {
      
      return null;
    }
}
