import 'package:Test/models/category_result.dart';
import 'package:Test/models/profile_result.dart';
import 'package:redux/redux.dart';

import 'actions.dart';
import 'app_state.dart';

final reducer = combineReducers<AppState>([

  TypedReducer<AppState, getCategory>(_fetchCategoryActionReducer),
  TypedReducer<AppState, GotCategoryResults>(_categoryActionReducer),
  TypedReducer<AppState, CategoryFailed>(_categoryFailedActionReducer),



]);


AppState _fetchCategoryActionReducer(AppState appState, getCategory action) {
  return appState.copy(
    results: Category(),
    dataState: EnumState.LOADING
  );
}

AppState _categoryActionReducer(AppState appState, GotCategoryResults action) {
  return appState.copy(
      results:action.results,
      dataState:  EnumState.SUCCESS
  );
}

AppState _categoryFailedActionReducer(AppState appState, CategoryFailed action) {
  return appState.copy(
      dataState: EnumState.FAILED
  );
}

final profileReducer = combineReducers<AppState>([


  TypedReducer<AppState, getProfile>(_fetchCProfileActionReducer),
  TypedReducer<AppState, GotProfileResults>(_profileActionReducer),
  TypedReducer<AppState, ProfileFailed>(_profileFailedActionReducer)


]);


AppState _fetchCProfileActionReducer(AppState appState, getProfile action) {
  print("Asdasdasdasd");
  return appState.copyProfile(
      results: ProfileModel(),
      dataState: EnumState.LOADING
  );
}

AppState _profileActionReducer(AppState appState, GotProfileResults action) {
  return appState.copyProfile(
      results:action.results,
      dataState:  EnumState.SUCCESS
  );
}

AppState _profileFailedActionReducer(AppState appState, ProfileFailed action) {
  return appState.copyProfile(
      dataState: EnumState.FAILED
  );
}