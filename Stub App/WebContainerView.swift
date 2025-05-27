//
//  WebContainerView.swift
//  Stub App
//
//  Created by elzhankk on 27.05.2025.
//

import SwiftUI
import WebKit

struct WebContainerView: View {
    let url: String
    @State private var progress: Double = 0
    @State private var isLoading = true
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView(value: progress)
                        .progressViewStyle(LinearProgressViewStyle())
                        .padding(.horizontal)
                }

                WebView(url: URL(string: url)!, progress: $progress, isLoading: $isLoading)
            }
            .navigationTitle("WebView")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Назад") {
                dismiss()
            })
        }
    }
}
