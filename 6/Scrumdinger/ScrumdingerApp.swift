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

/*
Swift property wrappers::
In Swift, a property wrapper encapsulates a common property-initialization pattern, helping you add behaviors to your properties efficiently. SwiftUI uses the @State and @Binding property wrappers, among others, to help you maintain sources of truth that your views can readily access.

State::
When you declare a property as a @State, you create a source of truth within your view. The system identifies all elements of a view that depend on the value of a @State property.

User interactions might change your @State property. The system renders a new version of the user interface by updating any views that depend on that property.
 
 When a @State property value changes, the system automatically redraws the view using the updated values of the property.
 
 Because state properties help manage transient states, like the highlight state of a button, filter settings, or a currently selected list item, declare state properties as private and avoid using them for persistent storage.
 
 The @State property wrapper is SwiftUI syntax for defining a mutable source of truth that’s local to your view structure.
 
 Binding::
 A property that you wrap with @Binding shares read and write access with an existing source of truth, like a @State property. A @Binding doesn’t store the data directly. Instead, it creates a two-way connection between an existing source of truth and a view that displays and updates that data. This connection ensures that multiple views associated with a piece of data are in sync.
 
 The system establishes dependencies between the data in @State and the child view that contains the @Binding. Either the parent or the child view can read or modify the property that you defined as the source of truth. If the child view has a read-only relationship with the source of truth defined in the parent, you can simply pass the value to the child view. In both cases, the framework automatically updates both views to reflect changes to the source of truth.

 This pattern of using bindings to propagate a single source of truth is effective for any number of levels in a view hierarchy.
*/
