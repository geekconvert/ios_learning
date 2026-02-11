/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

@main
struct ScrumdingerApp: App {
    //add a private @State property named scrums.
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
//            ScrumsView(scrums: DailyScrum.sampleData)
            //Pass a binding to scrums to the ScrumsView initializer.
            // you used @State to create a source of truth for a value type, and you used @Binding to share write access to a state with other views
            ScrumsView(scrums: $scrums)
        }
    }
}
