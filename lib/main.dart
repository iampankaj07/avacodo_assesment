import 'package:avacado_test/trending_bloc/home_page.dart';
import 'package:avacado_test/trending_bloc/trending_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avacado Test',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff17AF4E)),
          useMaterial3: true,
          textTheme: GoogleFonts.dmSansTextTheme()),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TrendingBloc(),
          ),
        ],
        child: Homepage(),
      ),
    );
  }
}
