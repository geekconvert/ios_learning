//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Anish kumar dubey on 10/02/26.
//

import SwiftUI

struct DetailEditView: View {
    
    /// Declare @State properties as private so that they can be accessed only within the view in which you define them.
    @State private var scrum: DailyScrum = DailyScrum.emptyScum
    @State private var attendeeName = "" /// The attendeeName property holds the attendee name that the user enters.
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                /// TextField takes a binding to a String. You can use the $ syntax to create a binding to scrum.title. The current view manages the state of the data property.
                TextField("Title", text: $scrum.title)
                HStack {
                    /// A Slider stores a Double from a continuous range that you specify. Passing a step value of 1 limits the user to choosing whole numbers.
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1){
                        /// The Text view won’t appear onscreen, but VoiceOver uses it to identify the purpose of the slider.
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    ///When the slider changes, you update a daily scrum state property that triggers a UI update. Because the text label displays the state property and the system automatically updates the views that depend on the state property, the slider and the label stay in sync.
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true) ///Hide the text view from VoiceOver. All the information that VoiceOver needs is in the accessibility value for the slider.
                }
            }
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                /// Add an onDelete modifier to remove attendees from the scrum data.
                /// The framework calls the closure you pass to onDelete when the user swipes to delete a row.
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    /// The binding keeps attendeeName in sync with the contents of the text field. It doesn’t affect the original DailyScrum model data.
                    TextField("New attendee", text: $attendeeName)
                    Button(action: {
                        /// Add an animation block that creates a new attendee and appends the new attendee to the attendees array.
                        withAnimation{
                            let attendee = DailyScrum.Attendee(name: attendeeName)
                            scrum.attendees.append(attendee)
                            /// Because the text field has a binding to attendeeName, setting the value to the empty string also clears the contents of the text field.
                            attendeeName = ""
                        }
                    }){
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(attendeeName.isEmpty) /// Add validation to this section of the form by disabling the button if attendeeName is empty. Adding this modifier prevents users from mistakenly saving an attendee without a name. The button activates when the user starts typing a name in the text field.
                }
            }
        }
    }
}

#Preview {
    DetailEditView()
}

/// SwiftUI observes @State properties and automatically redraws the view’s body when the property changes.
