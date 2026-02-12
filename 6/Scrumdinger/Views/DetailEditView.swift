/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

struct DetailEditView: View {
    /// The detail screen needs to update in response to changes made in the edit screen, so the detail screen shares a source of truth with the edit screen. You’ll convert the edit screen’s state property to a binding here, and supply the source of truth from the detail screen
    /// scrum is now an initialization parameter, so you need to remove the private attribute and DailyScrum initialization.
    @Binding var scrum: DailyScrum
//    @State private var scrum = DailyScrum.emptyScrum
    @State private var attendeeName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                /// The theme picker passes changes to the theme selection back to the scrum.theme property in the edit view.
                ThemePicker(selection: $scrum.theme)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $attendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: attendeeName)
                            scrum.attendees.append(attendee)
                            attendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(attendeeName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var scrum: DailyScrum = DailyScrum.sampleData[0]
    DetailEditView(scrum: $scrum)
}
