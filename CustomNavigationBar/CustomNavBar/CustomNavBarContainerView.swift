//
//  CustomNavBarContainerView.swift
//  CustomNavigationBar
//
//  Created by ChinhNT on 9/4/24.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {

    let content: Content
    @State private var showBackButton: Bool = true
    @State private var title: String = ""

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(showBackButton: showBackButton, title: title, showTrailingButton: true) {
                Button(action: {
                }, label: {
                    Text("Edit")
                        .font(.title)

                })
            }
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self, perform: { value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self, perform: { value in
            self.showBackButton = !value
        })
    }
}

#Preview {
    CustomNavBarContainerView {
        ZStack {
            Color.green.ignoresSafeArea()
                .customNavigationTitle("New title")
                .customNavigationBarBackButtonHidden(true)
        }
    }
}
