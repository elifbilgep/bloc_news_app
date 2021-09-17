import 'package:bloc_news_app/business_logic/news_bloc/news_bloc.dart';
import 'package:bloc_news_app/business_logic/news_bloc/news_states.dart';
import 'package:bloc_news_app/data/repository/article_repository.dart';
import 'package:bloc_news_app/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
     BlocProvider<NewsBloc>(create: (context) => NewsBloc(initialState: NewsInitSate(), articleRepository: ArticleRepository()) ) 
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Projem',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
