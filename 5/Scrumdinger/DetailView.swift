/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    
    @State private var isPresentingEditView = false

    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("edit"){
                isPresentingEditView = true
            }
        }
        ///Add a sheet modifier on List. When isPresentingEditView changes to true, the app presents DetailEditView using a modal sheet that partially covers the underlying content. Modal views remove users from the main navigation flow of the app. Use modality for short, self-contained tasks.
        .sheet(isPresented: $isPresentingEditView){
            NavigationStack {
                DetailEditView()
                    ///Set the navigation title of the edit view.
                    .navigationTitle(scrum.title)
                    ///You need the toolbar to offer different actions when the user is editing a scrum than when they’re viewing a scrum.
                    .toolbar {
                        ///Add a toolbar button that indicates to the user that they’re canceling changes to the scrum details. Dismiss DetailEditView in the Cancel button action.
                        ToolbarItem(placement: .cancellationAction){
                            Button("Cancel"){
                                isPresentingEditView = false
                            }
                        }
                        ///Add a toolbar button that indicates to the user that they’re saving changes. Dismiss DetailEditView in the Done button action.
                        ToolbarItem(placement: .confirmationAction) {
                            Button("done") {
                                isPresentingEditView = false
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: DailyScrum.sampleData[0])
    }
}
