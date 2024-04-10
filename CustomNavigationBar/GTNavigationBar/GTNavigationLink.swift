//
//  GTNavigationLink.swift
//  GTNavigationBar
//
//  Created by ChinhNT on 9/4/24.
//

import SwiftUI

struct GTNavigationLink<Label: View, Destination: View>: View {

    let destination: Destination
    let label: Label

    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }

    var body: some View {
        NavigationLink {
            GTNavigationBarContainerView {
                destination
            }
            .navigationBarHidden(true)
        } label: {
            label
        }

    }
}

#Preview {
    GTNavigationView {
        GTNavigationLink(destination: Text("Destination")) {
            Text("Click me")
        }
    }
}
