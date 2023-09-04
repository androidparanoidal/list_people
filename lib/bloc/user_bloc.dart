import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_12_4/bloc/user_bloc_event.dart';
import 'package:tutorial_12_4/bloc/user_bloc_state.dart';
import '../model/user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final userRepository;
  UserBloc({required this.userRepository}) : super(UserEmptyState()) {
    on<UserLoadEvent>(
      (event, emit) async {
        emit(UserLoadingState());
        try {
          final List<User> loadedUserList = await userRepository.getAllUsers();
          emit(UserLoadedState(loadedUser: loadedUserList));
        } catch (_) {
          emit(UserErrorState());
        }
      },
    );

    on<UserClearEvent>(
      (event, emit) async {
        emit(UserEmptyState());
      },
    );
  }
}
