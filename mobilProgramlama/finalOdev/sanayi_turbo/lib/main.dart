import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanayi_turbo/interface/cubit/pages_cubit/cart_page_cubit.dart';
import 'package:sanayi_turbo/interface/cubit/pages_cubit/favorites_page_cubit.dart';
import 'package:sanayi_turbo/interface/cubit/pages_cubit/search_page_cubit.dart';
import 'package:sanayi_turbo/interface/screens/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SearchPageCubit()),
        BlocProvider(create: (_) => FavoritePageCubit()),
        BlocProvider(create: (_) => CartPageCubit()),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("en", ""),
          Locale("tr", ""),
        ],
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
