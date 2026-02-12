//
//  CardView.swift
//  Scrumdinger
//
//  Created by Anish kumar dubey on 07/02/26.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum /// a constant named scrum. CardView() initializer now requires a DailyScrum parameter
    var body: some View {
        VStack(alignment: .leading){
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader) ///Apply the accessibilityAddTraits modifier. This modifier helps convey the information architecture of the view by reading the scrum title, followed by “heading.”
            
            Spacer()
            HStack{
                Label("\(scrum.attendees.count)", systemImage: "person.3") ///Label and Image use slightly different parameter labels for an SF Symbol. The Image uses Image(systemName:_), as opposed to Label(_:systemImage:).
                    .accessibilityLabel("\(scrum.attendees.count) attendees") ///Use an accessibility modifier to add a label that describes the contents of the first Label in the HStack
                Spacer() /// Add a Spacer between the labels to display the information around the perimeter of the view.
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    ///.padding(.trailing, 20) ///Add 20 points of trailing padding. You can also add padding to the .leading, .top, and .bottom edges of a view. padding was later replaced with labelStyle
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .labelStyle(.trailingIcon)
            }
            .font(.caption) ///Applying the font modifier to the horizontal stack also applies the modifier to the stack’s child views. SF Symbols used in labels and images scale and align appropriately with changes in font weight and size.
            
        }
        .padding() ///Add padding to the VStack to bring all the content in from the edges.
        .foregroundColor(scrum.theme.accentColor) /// Set the foregroundColor using scrum.theme.accentColor. The accentColor variable defined in Theme.swift returns black for light-colored themes and white for dark-colored themes.
    }
}

///Setting the preview layout and background color presents CardView as it’ll appear inside a List view.
#Preview(traits: .fixedLayout(width: 400, height: 60)) {
    let scrum = DailyScrum.sampleData[0] /// a static variable named scrum
    return CardView(scrum: scrum)
        .background(scrum.theme.mainColor) ///Specify a background color for the preview using scrum.theme.mainColor.
}

/// Change the canvas setting from Live to Selectable. By selecting options at the bottom left corner.
/// Change the Xcode preview mode from Selectable to Color Scheme Variants to render the view in light and dark appearances. By selecting options at the bottom left corner.
