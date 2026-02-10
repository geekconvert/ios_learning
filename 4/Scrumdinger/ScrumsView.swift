/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        //A NavigationStack container view allows you to traverse a stack of views in a hierarchy.
        //The list of scrums acts as the root view and is always present. Selecting a navigation link from the list adds a scrum detail view to the stack so that it covers the list. Navigating back removes the detail view and reveals the list again. The system disables backward navigation controls when the list of scrums is the only view in the stack.
        //Add a NavigationLink, passing Text(scrum.title) as the destination in the initializer.
        //The destination presents a single view in the navigation hierarchy when a user interacts with the element. Each row pushes to an individual destination.
//        NavigationStack{
//            List(scrums) { scrum in
//                NavigationLink(destination: Text(scrum.title)){
//                    CardView(scrum: scrum)
//                }
//                .listRowBackground(scrum.theme.mainColor)
//            }
//            .navigationTitle("Daily Scrums")
//            .toolbar(){
//                Button(action: {}){
//                    Image(systemName: "plus")
//                }
//                .accessibilityLabel("New Scrum")
//            }
//        }
        NavigationStack{
            List(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum)){
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar(){
                Button(action: {}){
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

#Preview {
    ScrumsView(scrums: DailyScrum.sampleData)
}
