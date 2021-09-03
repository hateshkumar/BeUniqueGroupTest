# flutter_redux_sample

A new Flutter application with redux as a state machine implemented inside.

This is an application that lets you search through book from the 
openlibrary.org database.

This repository is cretaed for learning purpose so devs would get a clear
 example on how to implement Redux inside their Flutter app.

# Components

- Api
    
    Consist of files that interacts with API Layer of the application,
    in this case, we call the search library from openlibrary.org through
     files inside this folder.
     
- Models
    
    Consist of files that defines the object we received from the openlibrary.org
    API, to parse the json we received into file. [This library](https://pub.dev/packages/json_serializable)
    is used.
    
- Redux
    Consist of files that handles all the state management inside this app. 
    Will be explained more on the Redux section
    
- UI
    
    UI Component files.
- Utils
    
    Miscellaneous files.
    
    
# Redux

I used this [redux](https://pub.dev/packages/redux) and
[flutter_redux](https://pub.dev/packages/flutter_redux) package to implement redux on this project.

Basically this app has 3 redux actions available (DoSearch, GotSearchResults, and SearchFailed)
which handles all the search flow from the beginning until we get the search results.

To add new action, we need to edit codes on these files,
 `actions.dart` which specify the possible actions, `reducer.dart` which specify the reducer for given action.
 If needed, you also could add new object inside the `AppState` class. And last, if you need to do something
  in the middle of an action, you could specify a new `Middleware` that handles that for you.