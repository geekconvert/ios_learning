//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Anish kumar dubey on 10/02/26.
//

import SwiftUI
import ThemeKit

struct ThemeView: View {
    let theme: Theme /// create a theme constant,
    var body: some View {
        Text(theme.name)
            .padding(4) // Add a padding of 4 to the label
            .frame(maxWidth: .infinity) /// Make the text view span the width of the parent view.
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor) /// accentColor is a computed variable that returns either black or white, depending on which maximizes the contrast with the theme’s mainColor.
            .clipShape(RoundedRectangle(cornerRadius: 4)) /// clip the shape of the view to a rounded rectangle.
    }
}

#Preview {
    ThemeView(theme: .buttercup)
}
