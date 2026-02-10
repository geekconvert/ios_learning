/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI


//You create a SwiftUI app by declaring a structure that conforms to the App protocol. The app’s body property returns a Scene that contains a view hierarchy representing the primary user interface for the app.
@main
struct ScrumdingerApp: App {
    
    var body: some Scene {
        //WindowGroup is one of the primitive scenes that SwiftUI provides. In iOS, the views you add to the WindowGroup scene builder are presented in a window that fills the device’s entire screen.
        WindowGroup {
            //MeetingView()
            //Now you’ll make ScrumsView the app’s root view.
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
