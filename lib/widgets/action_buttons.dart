import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_12_4/bloc/user_bloc_event.dart';
import '../bloc/user_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);

    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            _userBloc.add(UserLoadEvent());
          },
          child: Text('Load'),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            _userBloc.add(UserClearEvent());
          },
          child: Text('Clear'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
        ),
      ],
    );
  }
}
