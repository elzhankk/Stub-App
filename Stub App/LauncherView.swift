//
//  LauncherView.swift
//  Stub App
//
//  Created by elzhankk on 27.05.2025.
//

import SwiftUI
import FirebaseRemoteConfig

struct LauncherView: View {
    @State private var showWebView = false
    @State private var redirectLink: String?
    
    var body: some View {
        Group {
            if showWebView, let link = redirectLink {
                WebContainerView(url: link)
            } else {
                ContentView()
            }
        }
        .onAppear {
            loadRemoteConfig()
        }
    }
    
    func loadRemoteConfig() {
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0 // чтобы тестировать
        remoteConfig.configSettings = settings
        
        remoteConfig.fetchAndActivate { status, error in
            if let error = error {
                print("Remote Config error: \(error.localizedDescription)")
            }
            
            let needForceUpdate = remoteConfig["needForceUpdate"].boolValue
            let remoteLink = remoteConfig["redirectLink"].stringValue
            
            if !remoteLink.isEmpty {
                UserDefaults.standard.set(remoteLink, forKey: "SavedLink")
            }
            
            let finalLink = UserDefaults.standard.string(forKey: "SavedLink") ?? remoteLink
            
            DispatchQueue.main.async {
                showWebView = needForceUpdate
                redirectLink = finalLink
            }
        }
    }
}
