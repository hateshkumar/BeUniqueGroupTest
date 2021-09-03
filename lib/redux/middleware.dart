import 'package:Test/api/client.dart';
import 'package:redux/redux.dart';

import 'actions.dart';
import 'app_state.dart';

List<Middleware<AppState>> getMiddlewares(ApiClient apiClient) {
  return [
    TypedMiddleware<AppState, getCategory>(_fetchDataMiddleware(apiClient)),
    TypedMiddleware<AppState, getProfile>(_fetchDataMiddleware(apiClient))
  ];
}

Middleware<AppState> _fetchDataMiddleware(ApiClient apiClient) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    if (action is getCategory) {
      ApiClient().fetchCategoryResults().then((value) {
          store.dispatch(GotCategoryResults(results: value));
      }
      ).catchError((error) {
        store.dispatch(CategoryFailed());
      });
    }


    if (action is getProfile) {

      ApiClient().fetchProfileResults().then((value) {
        print("value $value");
        store.dispatch(GotProfileResults(results: value));
      }
      ).catchError((error) {
        print("error $error");
        store.dispatch(ProfileFailed());
      });
    }

  };
}