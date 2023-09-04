import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_12_4/bloc/user_bloc.dart';
import 'package:tutorial_12_4/services/user_repository.dart';
import '../widgets/action_buttons.dart';
import '../widgets/user_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(userRepository: userRepository),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'User list',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionButtons(),
            Expanded(child: UserList()),
          ],
        ),
      ),
    );
  }
}
