# flutter_todo

A simple Flutter To-Do list application, built using Firebase as a BaaS.

![Peek 03-02-2022 20-53](https://user-images.githubusercontent.com/29544679/152448845-d47df717-d3dd-4ef0-8934-86a7ce29e8f9.gif)

## Features

- Realtime representation of your current tasks
- Filtering by all, done and pending
- Simple and modern task creation form
- Easily mark a task as done by swiping it
- Delete any of the tasks in a single click

## Technology

- **Flutter**
- **Riverpod** for provider pattern
- **freezed** to better generate code
- **build_runner** to build and generate code
- **go_router** for application navigation 
- **Firebase** as a backend-as-a-service
- **FlutterFire** for Firebase Flutter plugins
- **shared_preferences** to work with local device storage

## Architecture

- **providers**: Riverpod providers
- **controllers**: Notifiers for Riverpod state management
- **extensions**: Dart extensions
- **models**: Domain models for Firestore interaction
- **pages**: Application UI pages
- **service**: Service layer, to abstract and encapsulate Firebase calls (enables switch to another backend in the future)
- **utils**: General utils 
- **widgets**: Reusable / encapsulated widgets
