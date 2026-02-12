/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

struct ScrumsView: View {
    /// convert the scrums constant to a binding.
//    let scrums: [DailyScrum]
    @Binding var scrums: [DailyScrum]
  
    var body: some View {
        NavigationStack {
            /// The List view passes a scrum into its closure, but the DetailView initializer expects a binding to a scrum. You’ll use array binding syntax to retrieve a binding to an individual scrum. To use array binding syntax in SwiftUI, you’ll pass a binding to an array into a List.
//            List(scrums) { scrum in
//                NavigationLink(destination: DetailView(scrum: scrum)) {
//                    CardView(scrum: scrum)
//                }
//                .listRowBackground(scrum.theme.mainColor)
//            }
//            .navigationTitle("Daily Scrums")
//            .toolbar {
//                Button(action: {}) {
//                    Image(systemName: "plus")
//                }
//                .accessibilityLabel("New Scrum")
//            }
            /// Update the list view initializer to include a binding to an array of scrums.
            /// Next, to complete the syntax, you’ll pass a binding to each iteration of the loop’s closure.
            /// The $ prefix accesses the projectedValue of a wrapped property. The projected value of the scrums binding is another binding.
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

#Preview {
    @Previewable @State var scrums = DailyScrum.sampleData
//    ScrumsView(scrums: DailyScrum.sampleData)
    ScrumsView(scrums: $scrums)
}
