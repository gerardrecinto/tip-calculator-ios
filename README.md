# Tip Calculator

![Swift](https://img.shields.io/badge/Swift-6.0-F05138?logo=swift&logoColor=white)
![iOS 16+](https://img.shields.io/badge/iOS-16%2B-000000?logo=apple&logoColor=white)
![UIKit](https://img.shields.io/badge/UIKit-Auto%20Layout-blue)

![Demo](docs/assets/demo2.gif)

> Two-screen UIKit tip calculator where `UISegmentedControl` selection triggers live recalculation as the user types, with the default tip percentage persisted to `UserDefaults` and restored on every `viewWillAppear`.

## Features

- **Live calculation on input:** `calculateTip(_:)` is wired as an `IBAction` to the bill `UITextField`'s editing-changed event — every keystroke recomputes tip and total without requiring a button tap.
- **Three-tier tip selection:** A `UISegmentedControl` with segments for 18%, 20%, and 25% drives `tipPercentages[tipControl.selectedSegmentIndex]` lookup; the bill amount is formatted with `String(format: "$%.2f", ...)` for two-decimal precision.
- **Persistent default tip:** `SettingsViewController` writes the selected segment index and its corresponding decimal value to `UserDefaults` under `"index"` and `"percent"` keys. `ViewController.viewWillAppear` reads both back and re-applies them, so the saved preference survives app restarts.
- **Keyboard-first launch:** `billField.becomeFirstResponder()` is called in `viewDidLoad`, so the numeric keyboard is visible immediately on launch without requiring an extra tap.
- **Progressive disclosure:** `tipLabel`, `totalLabel`, and `tipControl` start hidden (`isHidden = true`) and are revealed on the first `calculateTip` call, keeping the initial screen uncluttered until there is a value to display.
- **Settings propagation via view lifecycle:** The default percentage flows from `SettingsViewController` back to `ViewController` through `viewWillAppear` rather than a delegate or notification — no direct coupling between the two controllers.

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Swift 6.0 |
| UI | UIKit, UITextField, UISegmentedControl, UILabel |
| Layout | Auto Layout, Interface Builder |
| Persistence | UserDefaults |
| Navigation | UINavigationController, storyboard segues |

## Architecture

Two `UIViewController` subclasses connected by a navigation stack. `ViewController` owns bill entry and result display; `SettingsViewController` owns the default tip preference. State flows one way: settings are written to `UserDefaults` by `SettingsViewController.save(_:)` and read by `ViewController.viewWillAppear`, so there is no shared mutable state or delegate protocol between them. This makes the settings screen independently replaceable.

## Key Implementation

**UserDefaults round-trip:** `SettingsViewController` stores the segment index as an `Int` (`forKey: "index"`) and the pre-looked-up decimal as a `Double` (`forKey: "percent"`). `viewWillAppear` in the main controller reads both: the index to restore the segmented control's visual state, and the decimal to recalculate with the saved percentage even if the user hasn't tapped a new segment yet.

**Hidden-until-valid UI:** All output views are hidden at launch. `calculateTip` sets `isHidden = false` on its first call. This avoids showing `$0.00` placeholder values that would require the user to infer what the labels mean.

**Tap-to-dismiss keyboard:** An `onTap(_:)` `IBAction` on the root view calls `view.endEditing(true)`, dismissing the keyboard when the user taps outside the text field — the standard UIKit pattern for numeric entry screens.

## Setup

```bash
git clone https://github.com/gerardrecinto/tip-calculator-ios.git
open tip-calculator-ios/tip_calc.xcodeproj
```

Build and run on the iOS Simulator (Xcode 16+). No dependencies or API keys required.
