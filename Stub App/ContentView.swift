//
//  ContentView.swift
//  Stub App
//
//  Created by elzhankk on 27.05.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CharactersView()
                .tabItem {
                    Label("Characters", systemImage: "person.3.fill")
                }

            Text("Tab 2")
                .tabItem {
                    Label("Empty", systemImage: "square.grid.2x2")
                }

            Text("Tab 3")
                .tabItem {
                    Label("Empty", systemImage: "gearshape")
                }
        }
    }
}
