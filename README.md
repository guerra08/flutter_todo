# flutter_todo

A simple Flutter To-Do list application, built using Firebase as a BaaS.

![Peek 02-02-2022 18-26](https://user-images.githubusercontent.com/29544679/152240130-0404e89b-815f-4464-9cb6-e1036bb5e741.gif)

## Features

- Realtime representation of your current tasks
- Filtering by all, done and pending
- Simple and modern task creation form
- Easily mark a task as done by swiping it
- Delete any of the tasks in a single click

## Technology

- **Flutter**
- **Riverpod** for provider pattern
- **go_router** for application navigation 
- **Firebase** as a backend-as-a-service
- **FlutterFire** for Firebase Flutter plugins

## Architecture

- **providers**: Riverpod providers
- **models**: Domain models for Firestore interaction
- **pages**: Application UI pages
- **service**: Service layer, to abstract and encapsulate Firebase calls (enables switch to another backend in the future)
- **utils**: General utils 
- **widgets**: Reusable / encapsulated widgets
