//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Anish kumar dubey on 10/02/26.
//

import SwiftUI
import ThemeKit


struct ThemePicker: View {
    
    /// Try to maintain a single source of truth for every piece of data in your app. Instead of creating a new source of truth for the theme picker, you’ll use a binding that references a theme structure defined in the parent view.
    /// This binding communicates changes to the theme within the theme picker back to the parent view.
    @Binding var selection: Theme
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme) ///You can tag subviews when you need to differentiate among them in controls like pickers and lists. Tag values can be any hashable type like in an enumeration.
            }
        }
        .pickerStyle(.navigationLink) ///The default menu style displays the picker options with uniform text labels. When a user interacts with a navigation style picker, the system pushes the picker view onto the navigation stack. The picker view displays each theme in a ThemeView that highlights the theme’s color.
    }
}

#Preview {
    /// You can use the @Previewable macro on a variable inside a preview to make its views interactive. Previewable variables are useful for prototyping your app’s user interface.
    @Previewable @State var theme = Theme.periwinkle
    ThemePicker(selection: $theme)
}


/// In the ThemeKit Swift package, open Models > Theme.swift. Note that Theme conforms to CaseIterable and Identifiable.
/// Because of this conformance, you can easily access all the enumeration’s cases. CaseIterable allows iteration through all the theme cases. The name property returns a named version of the theme cases, representing each case as a raw string value. The id property ensures that each theme instance is automatically unique.
