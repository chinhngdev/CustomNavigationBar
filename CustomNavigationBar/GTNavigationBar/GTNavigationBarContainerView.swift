//
//  GTNavigationBarContainerView.swift
//  GTNavigationBar
//
//  Created by ChinhNT on 9/4/24.
//

import SwiftUI

struct GTNavigationBarContainerView<Content: View>: View {

    let content: Content
    @State private var showBackButton: Bool = true
    @State private var title: String = ""

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 0) {
            GTNavBarView(showBackButton: showBackButton, title: title, showTrailingButton: true) {
                NavigationLink {
                    ContentView()
                } label: {
                    Text("Edit")
                        .font(.title)
                }

            }
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(GTNavBarTitlePreferenceKey.self, perform: { value in
            self.title = value
        })
        .onPreferenceChange(GTNavBarBackButtonHiddenPreferenceKey.self, perform: { value in
            self.showBackButton = !value
        })
    }
}

#Preview {
    GTNavigationBarContainerView {
        ZStack {
            Color.green.ignoresSafeArea()
                .customNavigationTitle("New title")
                .customNavigationBarBackButtonHidden(true)
        }
    }
}
