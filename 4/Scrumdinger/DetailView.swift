//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Anish kumar dubey on 08/02/26.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    let scrum: DailyScrum //Add a scrum constant
    var body: some View {
        List{
            //Add a Section with the header Meeting Info
            //Sections create visual distinctions within your list. They help you to chunk content and establish groups in the information hierarchy of the list view.
            Section(header: Text("Meeting Info")){
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer") //By default, VoiceOver reads the title of the Label. If you want VoiceOver to convey more detail, replace the default spoken text by adding an accessibilityLabel that describes the element.
                        .font(.headline)//Alter the appearance of the label by adding foregroundColor and font modifiers.
                        .foregroundColor(.accentColor)
                }
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)//Add accessibilityElement(children:) to the HStack to combine the Label and Text elements for accessibility users. VoiceOver then reads the two elements as one statement, for example, “Length, 10 minutes.” Without the modifier, VoiceOver users have to swipe again between each element.
                HStack{
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
                //ForEach is a ViewBuilder that computes views on demand from an underlying collection of data. 
                ForEach(scrum.attendees) {attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "chevron.left")
                            Text("Daily Scrums")
                        }
                    }
                }
            }
    }
}

#Preview {
    NavigationStack{
        DetailView(scrum: DailyScrum.sampleData[0])
    }
}
