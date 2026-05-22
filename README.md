# Tip Calculator

![Swift](https://img.shields.io/badge/Swift-3%2B-F05138?logo=swift&logoColor=white)
![iOS 9+](https://img.shields.io/badge/iOS-9%2B-000000?logo=apple&logoColor=white)
![UIKit](https://img.shields.io/badge/UIKit-Animations-blue)

![Demo](docs/assets/demo2.gif)

Tip calculator with live calculation, configurable default percentage, and bill amount persistence across app restarts.

## Features

- Bill entry with live tip and total across 15%, 18%, and 20%
- Configurable default tip percentage in Settings
- Keyboard always visible on launch, no extra tap required
- Bill amount persisted to UserDefaults, clears after 10 minutes
- Animated transitions and custom launch screen

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Swift |
| UI | UIKit, Auto Layout, UIView animations |
| Persistence | UserDefaults |

## Setup

```bash
git clone https://github.com/gerardrecinto/tip-calculator-ios.git
open tip-calculator-ios/TipCalculator.xcodeproj
```

Build and run on the iOS Simulator (Xcode 8+).
