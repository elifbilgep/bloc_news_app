import 'package:bloc_news_app/business_logic/news_bloc/news_events.dart';
import 'package:bloc_news_app/business_logic/news_bloc/news_states.dart';
import 'package:bloc_news_app/data/models/article_model.dart';
import 'package:bloc_news_app/data/repository/article_repository.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsEvents, NewsStates> {
  final ArticleRepository articleRepository;

  NewsBloc(
      {@required NewsStates initialState, @required this.articleRepository})
      : super(initialState) {
    add(StartEvent());
  }

  @override
  Stream<NewsStates> mapEventToState(NewsEvents event) async* {
    if (event is StartEvent) {
      try {
        Article _articleList;
        yield NewsLoadingState();
        _articleList = await articleRepository.fetchNewsFromDataRepo();
        print(_articleList.toString());
        yield NewsLoadedState(articleList: _articleList);
      } catch (e) {
        yield NewsErrorState(errorMessage: e.toString());
      }
    }
  }
}
