import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:clean_bloc_movies/common/constants/languages.dart';
import 'package:clean_bloc_movies/domain/entities/language_entity.dart';
import 'package:equatable/equatable.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageLoaded(Locale(Languages.languages[0].code)));

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    if (event is ToggleLanguageEvent) {
      yield LanguageLoaded(Locale(event.language.code));
    }
  }
}
