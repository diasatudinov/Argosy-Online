import SwiftUI

@main
struct Argosy_OnlineApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ArgosyRoot()
                .preferredColorScheme(.light)
        }
    }
}
