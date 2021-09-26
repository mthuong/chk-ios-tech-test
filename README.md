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

### CLEAN + MVVM

Why?
There are many different architect patterns in Software Engineering. In mobile software, the most popular used are MVVM and Clean Architect

It will help to divide project into 3 main layers

