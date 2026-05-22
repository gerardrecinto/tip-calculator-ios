# Tip Calculator

![Swift](https://img.shields.io/badge/Swift-3%2B-F05138?logo=swift&logoColor=white)
![iOS 9+](https://img.shields.io/badge/iOS-9%2B-000000?logo=apple&logoColor=white)
![UIKit](https://img.shields.io/badge/UIKit-Animations-blue)

An iOS tip calculator built with Swift and UIKit. Enter a bill amount, select a tip percentage, and instantly see the tip and total.

## Features

- Bill entry with live tip and total calculation
- Configurable default tip percentage in Settings
- Keyboard always visible on launch — no extra tap needed
- Bill amount persisted across app restarts (clears after 10 minutes)
- Animated transitions and a custom launch screen

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Swift |
| UI | UIKit, Auto Layout, UIAnimations |
| Persistence | UserDefaults |

## Setup

```bash
git clone https://github.com/gerardrecinto/Tip-Calculator.git
open TipCalculator/TipCalculator.xcodeproj
```

Build and run on the iOS Simulator (Xcode 8+).

## Demo

![Demo](https://i.imgur.com/57tN375.gif)
