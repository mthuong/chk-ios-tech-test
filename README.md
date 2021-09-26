# CHK Tech Test Design Document

## ⭐ Demo

https://user-images.githubusercontent.com/1086057/134797520-321436f2-3839-40f6-a9e3-f610d34a69c3.mp4

### :apple: Feature

- View the price of crypto currencies.
- Refresh data every 30 seconds.
- Search functions for names to find currencies.
- Unit testing
- UI testing

### :red_car: Required to run

- XCode 12.4 or later
- iOS 14 or later

### ✅ UnitTest - UITest

```bash
xcodebuild test -project CHK\ Tech.xcodeproj -scheme CHK\ Tech -destination 'platform=iOS Simulator,name=iPhone 12 Pro Max,OS=14.4'
```

## ⛓ CLEAN MVVM
