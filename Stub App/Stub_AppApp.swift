//
//  Stub_AppApp.swift
//  Stub App
//
//  Created by elzhankk on 27.05.2025.
//

import SwiftUI
import Firebase

@main
struct StubApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            LauncherView() // теперь это стартовое окно
        }
    }
}
