# CHK Tech Test Design Document

## ⭐ Demo

https://user-images.githubusercontent.com/1086057/134797520-321436f2-3839-40f6-a9e3-f610d34a69c3.mp4

### :apple: Feature

- View the price of crypto currencies.
- Refresh data every 30 seconds.
- Search functions for names to find currencies.

### :red_car: Requirements

- XCode 12.4+
- Swift 5+
- iOS 14+

### ✅ UnitTest - UITest

```bash
xcodebuild test -project CHK\ Tech.xcodeproj -scheme CHK\ Tech -destination 'platform=iOS Simulator,name=iPhone 12 Pro Max,OS=14.4'
```

## ⛓ Design architect

Build the demo by CLEAN + MVVM architect using SwiftUI with Combine

### 🥇 CLEAN + MVVM

Why?
There are many different architect patterns in Software Engineering. In mobile software, the most popular used are MVVM and Clean Architect

It will help to divide project into 3 main layers

![CLEAN-MVVM-SwiftUI-Combine](https://user-images.githubusercontent.com/1086057/134799312-4cbb641f-25ca-4346-94d7-945043ec127e.png)

#### ❌ Domain layer

It is the independent layer, the most inside of the onion which includes the business logic of the app:

- Contains `Entities`, `UseCases`.
- Each use case will do a single business logic.
It is totally independent and can be reused by other projects.
- Fetches data from Repository through repository protocol.
- `Endpoints` specific REST API endpoints.
- Domain layer doesn't know any thing about outer layers(UI, Data).

#### ❌ Data layer

- It contains `Repository` or data stores to store data locally.
- It uses repository design pattern. A design pattern that provides abstraction of data.
- It's responsible for getting data from data source from local database or from API.
- `Domain` layer doesn't know where the data come from. just tell the repository that it needs data and the repo decides where to fetch them.
- It depends on `Domain` layer.

#### ❌ Presentation layer

- Contains UI of our application and also `ViewModel`.
- `View` passive and doesn't contain any business logic inside. It's responsibility is to display UI elements.
- `ViewModel` are responsible for executing one or many use cases.
- `ViewModel` keep the state of the `View` by having `Published` properties and binding them to the data it receives from use cases.
- `Router` responsible for navigation.
- It depends on `Domain` layer.

The main purpose of applying software architect in development that will help to easier maintenance the project, add new feature and didn't break other feature, the most important thing: our code is testable.

The example project has **90%** test coverage, that's so good.

### 🥈 SwiftUI

As Apple, SwiftUI is a modern way to declare user interfaces for any Apple platform. Create beautiful, dynamic apps faster than ever before.
We can preview the code instantly. It will compiled the UI — visible, and editable at all times. Previews can also display your UI in any device and any orientation.

### 🥉 Combine

It's a new framework provides a declarative Swift API for processing values over time. Now we can replace RxSwift, ReactiveSwift with Combine.

It’s a powerful framework to dynamically respond to value changes over time.
