//
//  CustomNavBarView.swift
//  CustomNavigationBar
//
//  Created by ChinhNT on 9/4/24.
//

import SwiftUI

struct CustomNavBarView<TrailingButton: View>: View {
    @Environment(\.presentationMode) var presentationMode
    let showBackButton: Bool
    let title: String
    let showTrailingButton: Bool
    let trailingButton: TrailingButton

    init(
        showBackButton: Bool,
        title: String,
        showTrailingButton: Bool,
        @ViewBuilder trailingButton: () -> TrailingButton
    ) {
        self.showBackButton = showBackButton
        self.title = title
        self.showTrailingButton = showTrailingButton
        self.trailingButton = trailingButton()
    }

    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            titleSection
            Spacer()
            if showTrailingButton {
                trailingButton
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(
            Color.blue.ignoresSafeArea(edges: .top)
        )
    }
}

extension CustomNavBarView {
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
        })
    }

    private var titleSection: some View {
        Text(title)
            .font(.title)
    }
}

#Preview {
    VStack {
        CustomNavBarView(showBackButton: true, title: "Title here", showTrailingButton: true) {
            Button(action: {
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
            })
        }
        Spacer()
    }
}
