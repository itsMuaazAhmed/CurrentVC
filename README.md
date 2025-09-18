# CurrentVC

A lightweight Swift package for debugging iOS/iPadOS apps.  
Logs the **currently presented view controller** to the console, either **manually** or **automatically**.

---

## ✨ Features
- Print the top-most `UIViewController` to the console
- Works with `UINavigationController`, `UITabBarController`, and presented controllers
- **Automatic logging** on every `viewDidAppear` (optional)
- Supports both UIKit and SwiftUI apps
- Zero dependencies

---

## 📦 Installation

### Swift Package Manager (SPM)

In Xcode:  
1. Go to **File → Add Packages…**  
2. Enter the repository URL:  

```text  
https://github.com/itsMuaazAhmed/CurrentVC
```   

3. Add the package to your app target.

---

## 🛠 Usage

### Manual Logging
Call `log()` whenever you want to check which controller is currently on screen:

```swift
import CurrentVC

CurrentVC.log()
``` 

**Example Output**
```text 
📱 Current presented controller: HomeViewController
``` 

---

### Automatic Logging
Enable once at app startup, and every `viewDidAppear` will automatically print the current controller.

#### UIKit (AppDelegate)
```swift
import UIKit
import CurrentVC

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        CurrentVC.enableAutoLogging()
        return true
    }
}
```

#### SwiftUI (with App struct)
```swift
import SwiftUI
import CurrentVC

@main
struct MyApp: App {
    init() {
        CurrentVC.enableAutoLogging()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

**Example Output**
```text 
📱 Current presented controller: LoginViewController
📱 Current presented controller: HomeViewController
📱 Current presented controller: ProfileViewController
``` 

---

## 🧪 Requirements
- iOS / iPadOS 13.0+
- Swift 5.9+
- Xcode 15+

---

## 🗂 Project Structure
```text 
Sources/
 └── CurrentVC/
     └── CurrentVC.swift
```

---

## 🤝 Contributing
Contributions, issues, and feature requests are welcome!  
Feel free to open a Pull Request or file an Issue.

---

## 📄 License
This project is licensed under the MIT License.  
See [LICENSE](LICENSE) for details.
