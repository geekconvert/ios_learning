//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Anish kumar dubey on 07/02/26.
//

import SwiftUI

/// Create a new structure named TrailingIconLabelStyle that conforms to LabelStyle. If you don’t want to create a custom label style, you can use one of the built-in label styles that display the icon, the title, or both using a system-standard layout.
struct TrailingIconLabelStyle: LabelStyle {
    
    /// The system calls this method for each Label instance in a view hierarchy where this style is the current label style.
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.title /// The configuration parameter is a LabelStyleConfiguration, which contains the icon and title views. These views represent the label’s image and text.
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self {Self()}
}

