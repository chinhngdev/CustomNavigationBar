//
//  CustomNavView.swift
//  CustomNavigationBar
//
//  Created by ChinhNT on 9/4/24.
//

import SwiftUI
import UIKit

struct CustomNavView<Content: View>: View {

    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        NavigationView {
            CustomNavBarContainerView {
                content
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}

#Preview {
    CustomNavView {
        Color.red.ignoresSafeArea()
    }
}
