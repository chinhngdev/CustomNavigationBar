//
//  ContentView.swift
//  CustomNavigationBar
//
//  Created by ChinhNT on 9/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GTNavigationView {
            ZStack {
                Color.orange.ignoresSafeArea()
                GTNavigationLink(destination:
                                Text("Destination")
                    .customNavigationTitle("Second screen")
                ) {
                    Text("Navigate")
                }
            }
            .customNavBarItems(title: "New title", subtitle: nil, backButtonHidden: true)
        }
    }
}

extension ContentView {
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                NavigationLink {
                    Text("Destination")
                        .navigationTitle("Title 2")
                        .navigationBarBackButtonHidden(false)
                } label: {
                    Text("Navigate")
                }
            }
            .navigationTitle("Nav title here")
        }
    }
}

#Preview {
    ContentView()
}
