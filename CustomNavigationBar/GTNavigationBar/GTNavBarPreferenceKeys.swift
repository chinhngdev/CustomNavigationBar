//
//  GTNavBarPreferenceKeys.swift
//  GTNavigationBar
//
//  Created by ChinhNT on 9/4/24.
//

import Foundation
import SwiftUI

struct GTNavBarTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""

    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct GTNavBarBackButtonHiddenPreferenceKey: PreferenceKey {
    static var defaultValue: Bool = false

    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

extension View {

    func customNavigationTitle(_ title: String) -> some View {
        preference(key: GTNavBarTitlePreferenceKey.self, value: title)
    }

    func customNavigationBarBackButtonHidden(_ hidden: Bool) -> some View {
        preference(key: GTNavBarBackButtonHiddenPreferenceKey.self, value: hidden)
    }

    func customNavBarItems(title: String = "", subtitle: String? = nil, backButtonHidden: Bool = false) -> some View {
        self.customNavigationTitle(title)
            .customNavigationBarBackButtonHidden(backButtonHidden)
    }
}
