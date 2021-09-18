import 'package:bloc_news_app/data/models/article_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class NewsStates extends Equatable {
  const NewsStates();

  @override
  List<Object> get props => throw UnimplementedError();
}

class NewsInitSate extends NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsLoadedState extends NewsStates {
  final Article articleList;
  NewsLoadedState({@required this.articleList});
}

class NewsErrorState extends NewsStates {
  final String errorMessage;

  NewsErrorState({@required this.errorMessage});
}
