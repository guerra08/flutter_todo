# flutter_todo

A simple Flutter To-Do list application, built using Firebase as a BaaS.

## Technology

- **Flutter**
- **get_it** for service locator patterns
- **go_router** for application navigation 
- **Firebase** as a backend-as-a-service
- **FlutterFire** for Firebase Flutter plugins

## Architecture

- **locator**: service locator
- **models**: domain models for Firestore interaction
- **pages**: application UI pages
- **service**: service layer, to abstract and encapsulate Firestore calls (enables switch to another backend in the future)
- **utils**: general utils 
- **widgets**: reusable / encapsulated widgets
