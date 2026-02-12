//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Anish kumar dubey on 08/02/26.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum] //a constant property named scrums of type [DailyScrum].
    var body: some View {
        /// you’ll create a List by passing both a collection of items and a closure that creates a view for each item to the initializer.
        /// The List needs a way to identify individual items in the collection. For now, because all of the scrums in the test data have different names, you can use the title property to identify each item.
//        List(scrums, id: \.title){scrum in
//            CardView(scrum: scrum)
//                .listRowBackground(scrum.theme.mainColor)
//        }
        
        /// List is a container view that displays rows of data arranged in a single, scrollable column.
        /// Now that DailyScrum conforms to the Identifiable protocol, you can simplify the List initializer.
        List(scrums){scrum in
            CardView(scrum: scrum)
                .listRowBackground(scrum.theme.mainColor)
        }
    }
}

#Preview {
    ScrumsView(scrums: DailyScrum.sampleData)
}
