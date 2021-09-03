import 'package:Test/api/client.dart';
import 'package:Test/redux/reducer.dart';
import 'package:redux/redux.dart';
import 'app_state.dart';
import 'middleware.dart';

final store = Store<AppState>(
    reducer,
    initialState: AppState.create(),
    middleware: getMiddlewares(ApiClient())
);

final profileStore = Store<AppState>(
    profileReducer,
    initialState: AppState.create(),
    middleware: getMiddlewares(ApiClient())
);

