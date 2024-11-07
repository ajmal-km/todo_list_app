import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils/app_utils.dart';
import '../state/home_screen_state.dart';

final homeScreenProvider =
    StateNotifierProvider<HomeControllerStateNotifier, HomeScreenState>(
        (ref) => HomeControllerStateNotifier());

class HomeControllerStateNotifier extends StateNotifier<HomeScreenState> {
  HomeControllerStateNotifier()
      : super(HomeScreenState(
          name: "",
          tasks: [],
          loading: false,
        ));

  Future<void> getName() async {
    state = state.copyWith(isLoading: true);
    state = state.copyWith(username: await AppUtils.getUserName(), isLoading: false);
  }

  Future<void> onLoggedOut() async {
    await AppUtils.onLogout();
  }
}
