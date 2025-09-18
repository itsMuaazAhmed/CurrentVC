// The Swift Programming Language
// https://docs.swift.org/swift-book

#if canImport(UIKit)
import UIKit

public enum CurrentVC {
    /// Prints the top-most presented VC manually
    @MainActor public static func log() {
        guard let root = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first?.windows
            .first(where: { $0.isKeyWindow })?.rootViewController else {
            print("❌ No root view controller found.")
            return
        }
        
        let topVC = getTopViewController(from: root)
        print("📱 Current presented controller: \(type(of: topVC))")
    }
    
    /// Enables automatic logging on every viewDidAppear
    @MainActor public static func enableAutoLogging() {
        UIViewController.enableCurrentVCAutoLogging()
    }
    
    @MainActor private static func getTopViewController(from vc: UIViewController) -> UIViewController {
        if let presented = vc.presentedViewController {
            return getTopViewController(from: presented)
        }
        if let nav = vc as? UINavigationController, let visible = nav.visibleViewController {
            return getTopViewController(from: visible)
        }
        if let tab = vc as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(from: selected)
        }
        return vc
    }
}

@MainActor private var hasSwizzled = false

extension UIViewController {
    static func enableCurrentVCAutoLogging() {
        guard !hasSwizzled else { return } // prevent multiple swizzles
        hasSwizzled = true
        
        let original = #selector(UIViewController.viewDidAppear(_:))
        let swizzled = #selector(UIViewController.currentVC_viewDidAppear(_:))

        if let originalMethod = class_getInstanceMethod(UIViewController.self, original),
           let swizzledMethod = class_getInstanceMethod(UIViewController.self, swizzled) {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }

    @objc private func currentVC_viewDidAppear(_ animated: Bool) {
        // Call original implementation
        self.currentVC_viewDidAppear(animated)
        
        // Auto log
        print("📱 Current presented controller: \(type(of: self))")
    }
}
#endif
