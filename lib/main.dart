import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imtixon_6/bloc/auth_bloc/auth_bloc.dart';
import 'package:imtixon_6/bloc/expanse_bloc/expanse_bloc.dart';
import 'package:imtixon_6/services/expanse_local_services.dart';
import 'package:imtixon_6/ui/screens/home/home_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ExpanseBloc(expanseLocalServices: ExpanseLocalServices()),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
