import 'package:Test/models/category_result.dart';
import 'package:Test/models/profile_result.dart';

class AppState {

  final Category results;
  final ProfileModel profileModel;
  final EnumState dataState;

  AppState({this.results, this.dataState = EnumState.IDLE,this.profileModel});

  factory AppState.create() => AppState();

  AppState copy({
    Category results,
    EnumState dataState
  }) => AppState(
      results: results ?? this.results,
      dataState: dataState ?? this.dataState
  );

  AppState copyProfile({
    ProfileModel results,
    EnumState dataState
  }){

    print("copyProfile");
    return AppState(
        profileModel: results ?? this.profileModel,
        dataState: dataState ?? this.dataState
    );
  }

}

enum EnumState {
  IDLE,
  LOADING,
  SUCCESS,
  FAILED
}